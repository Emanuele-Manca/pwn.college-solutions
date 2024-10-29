#include <unistd.h>
#include <sys/wait.h>

void pwncollege(){}

int main(){

    if(!fork()){
        execl("/challenge/embryoio_level135", (char*)NULL);
    }else{
        wait(NULL);
    }

}