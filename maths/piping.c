
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

void pwncollege(){}

int main(){

    if(!fork()){ // child
        
        // FILE* in = popen("cat < ./out", "r");
        // FILE* out = popen("cat > ./in", "w");

        // printf("Changing stdin/stdout\n");
        // dup2(fileno(in), STDIN_FILENO);
        // dup2(fileno(out), STDOUT_FILENO);
        execl("/challenge/embryoio_level139", (char*)NULL);
        // pclose(in);
        // pclose(out);

    }else{ // parent

        // int in = open("./in", O_RDONLY);
        // dup2(in, STDIN_FILENO);
        // execl("./prog", (char*)NULL);
        // close(in);
        wait(NULL);
    }

    return 0;
}