#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void pwncollege(){}

int main(){

    int pipefd[2];
    pipe(pipefd);

    int pid = fork();

    if(!pid){ 
        close(pipefd[0]);
        dup2(pipefd[1], STDOUT_FILENO);
        execl("/usr/bin/rev", "/tmp/input", (char*)NULL);
        close(pipefd[1]);
        
    }else{ 
        close(pipefd[1]);
        dup2(pipefd[0], STDIN_FILENO);
        execl("/challenge/embryoio_level135", (char*)NULL);
        close(pipefd[0]);
        wait(NULL);
    }

    return 0;
}