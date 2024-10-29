
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

void pwncollege(){}

int main(){

    if(!fork()){ // child
        
        int out = open("./in", O_WRONLY);
        int in = open("./out", O_RDONLY);
        if(in < 0 || out < 0){
            printf("Error on opening files\n");
            return -1;
        }
        
        printf("Changing stdin/stdout\n");
        dup2(in, STDIN_FILENO);
        dup2(out, STDOUT_FILENO);
        execl("/challenge/embryoio_level136", (char*)NULL);
        close(in);
        close(out);

    }else{ // parent

        // int in = open("./in", O_RDONLY);
        // dup2(in, STDIN_FILENO);
        // execl("./prog", (char*)NULL);
        // close(in);
        wait(NULL);
    }

    return 0;
}