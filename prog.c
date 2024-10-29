#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void pwncollege(){}


int main(){

    int pid = fork();

    if(!pid){ // child
        dup2(0, 126);
        execl("/challenge/embryoio_level120", (char*)NULL);
    }else{ //parent
        wait(NULL);
    }

    return 0;
}