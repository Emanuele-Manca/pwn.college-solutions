/* strtok example */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>

#define OPS "+*&^%|"

void allocate(char* tok[3], char* ls, char* le, char* op, char* rs, char* re){
    
    tok[0] = (char*)calloc(le-ls, sizeof(char));
    tok[1] = (char*)calloc(2, sizeof(char));
    tok[2] = (char*)calloc(re-rs, sizeof(char));

    memcpy(tok[0], ls+1, le-ls-1);
    memcpy(tok[1], op, 1);
    memcpy(tok[2], rs+1, re-rs-1);
}

int token(char* tok[3], char* str){
    /*
        (left) op. (right)
        l -> left
        r -> right

        s -> start
        e -> end

        c -> count of innested parenthesis
    */
    char *le, *ls, *rs, *re, *op;
    int len = strlen(str);

    ls = strchr(str, '(');
    if(!ls){
        ls = str;
        le = str+1;
        while(isdigit((char)*le)) le++;
        op = le;
        le--;
        rs = op+1;
        re = str + strlen(str)-1;

        tok[0] = (char*)calloc(le-ls+2, sizeof(char));
        tok[1] = (char*)calloc(2, sizeof(char));
        tok[2] = (char*)calloc(re-rs+2, sizeof(char));

        memcpy(tok[0], ls, le-ls+1);
        memcpy(tok[1], op, 1);
        memcpy(tok[2], rs, re-rs+1);

        return 0;
    }
    re = strrchr(str, ')');
    
    le = ls;
    rs = re;
    int lc = 1, rc = 1;

    while(lc){
        le++;
        if(*le == ')'){
            lc--;
        }else if( *le == '('){
            lc++;
        }
    }
    if(le == re && le-str == len-1){ // 12 * (34*2)
        rs = str;
        re = rs + strcspn(rs, " ");
        op = re+1;
        allocate(tok, rs, re, op, ls, le);
        return 1;
    }
    while(rc){
        rs--;
        if(*rs == ')'){
            rc++;
        }else if( *rs == '('){
            rc--;
        }
    }
    if(rs == ls && rs == str){   // (12+3) / 4
        op = le+2;
        rs = op+1;
        re = str + strlen(str);
    }else{
        op = le + 2;
    }
    allocate(tok, ls, le, op, rs, re);
    return 1;
    /*
    printf("ls= %c:%d[%c]\nle= %c:%d[%c]\nrs= %c:%d[%c]\nre= %c:%d[%c]\n", 
            *ls, ls-str, str[ls-str], *le, le-str, str[le-str], *rs, rs-str, str[rs-str],*re, re-str, str[re-str]);
    */

}

int contains(char* str, char* match){
    int l = strlen(match);
    while(*str){
        for(int i = 0; i < l; i++){
            if(*str == match[i]){
                return 1;
            }
        }
        str++;
    }
    return 0;
}

unsigned long compute(char* str){
    if(!contains(str, OPS)){
        return atol(str); 
    }
    char* tok[3];
    token(tok, str);
    unsigned long l = compute(tok[0]);
    unsigned long r = compute(tok[2]);
    switch(tok[1][0]){
    case '+':
        return l + r;
    case '*':
        return l * r;
    case '&':
        return l & r;
    case '^':
        return l ^ r;
    case '%':
        return l % r;
    case '|':
        return l | r;
    }
    free(tok[0]);
    free(tok[1]);
    free(tok[2]);
}


int main(){

    char *str = NULL, *expr;
    unsigned long len = 0;
    int off = 0;
    
    FILE* out = fdopen(3, "w");
    if(out < 0){
        printf("Error opening output\n");
        return -1;
    }

    getline(&str, &len, stdin);
    printf("READ: %s", str);
    if(strstr(str, "CHALLENGE") == NULL){
        return -1;
    }

    len = strlen(str)-1;
    str[len] = '\0';        // removing \n

    if( (off = strcspn(str, "123456789(")) != len ){

        expr = str+off;
        printf("EXPR: '%s'\n", expr);
        unsigned long res = compute(expr);
        fprintf(out, "%ld\n", res);
        //printf("RES: %ld\n", res);
        fclose(out);
        //out = fopen("./out", "w");
    }

    free(str);
    
    return 0;
}

/*
void printexptr_r(char* str, int depth){
    char *tok[3];
    if(!token(tok, str)){
        for(int i = 0; i < depth; i++) printf("- ");
        printf("%s %s %s\n", tok[0], tok[1], tok[2]);
        return;
    }
    printexptr_r(tok[0], depth+1);
    for(int i = 0; i < depth; i++) printf("- ");
    printf("%s\n", tok[1]);
    printexptr_r(tok[2], depth+1);
}

void printexptr(char* expr){
    printexptr_r(expr, 0);
}

int main ()
{   

        char *str;
        unsigned long l = 0;
        getline(&str, &l, stdin);
        printf("%d\n", compute(str));
        free(str);

/*
    char* tok[3];
    if( token(tok, str) ){
        for(int i = 0; i < 3; i++){
            printf("%s\n", tok[i]);
        }
    }
    return 0;
}
*/