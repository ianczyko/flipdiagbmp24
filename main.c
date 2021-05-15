#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern void flipdiagbmp24(void *img, int width);

int main(void) {
    FILE *fp;
    // Load filename from stdin
    char file_name[128];
    printf("Enter filename... ");
    fgets(file_name, 128, stdin);
    file_name[strcspn(file_name, "\n")] = 0;
    // Hardcoded filename option for debugging
    // char file_name[128] = "images/5x5.bmp";
    fp = fopen(file_name, "rb");
    if (fp == NULL) {
        printf("File not found.\n");
        return 0;
    }
    unsigned short headerField, bpp;
    fread(&headerField, 2, 1, fp);
    if (headerField != 0x4D42) {
        printf("File is not a supported image (header start is not \"BM\")\n");
        return 0;
    }
    fseek(fp, 28, SEEK_SET);
    fread(&bpp, 2, 1, fp);
    if (bpp != 24) {
        printf("Only 24 bpp is supported, %d were given.\n", bpp);
        return 0;
    }
    unsigned int width, height;
    fseek(fp, 18, SEEK_SET);
    fread(&width, 4, 1, fp);
    fread(&height, 4, 1, fp);
    if (width != height) {
        printf("Only square images are supported, %dx%d were given.\n", width, height);
        return 0;
    }

    unsigned int bmpSize, offset;

    fseek(fp, 2, SEEK_SET);
    fread(&bmpSize, 4, 1, fp);

    fseek(fp, 10, SEEK_SET);
    fread(&offset, 4, 1, fp);

    void *entireImg = malloc(bmpSize);
    void *img = entireImg + offset;
    fseek(fp, 0, SEEK_SET);
    fread(entireImg, 1, bmpSize, fp);
    fclose(fp);

    flipdiagbmp24(img, (int)width);

    fp = fopen(file_name, "wb");
    if (fp == NULL) {
        printf("An error occurred while opening the file to write.\n");
        return 0;
    }
    fwrite(entireImg, 1, bmpSize, fp);
    fclose(fp);
    free(entireImg);
    return 0;
}
