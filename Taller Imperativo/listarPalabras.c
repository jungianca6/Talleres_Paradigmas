#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_WORD_LENGTH 100
#define MAX_LINE_LENGTH 512

// Estructura para almacenar los números de línea
typedef struct LineNode {
    int line_number;
    struct LineNode *next;
} LineNode;

// Estructura para cada palabra
typedef struct WordNode {
    char word[MAX_WORD_LENGTH];
    LineNode *lines;
    struct WordNode *next;
} WordNode;

// Función para crear un nuevo nodo de línea
LineNode* createLineNode(int line_number) {
    LineNode *new_node = (LineNode*)malloc(sizeof(LineNode));
    new_node->line_number = line_number;
    new_node->next = NULL;
    return new_node;
}

// Función para agregar un número de línea a una palabra
void addLine(WordNode *word_node, int line_number) {
    LineNode *current = word_node->lines;
    while (current != NULL) {
        if (current->line_number == line_number) return;
        if (current->next == NULL) {
            current->next = createLineNode(line_number);
            return;
        }
        current = current->next;
    }
}

// Función para crear un nodo de palabra
WordNode* createWordNode(char *word, int line_number) {
    WordNode *new_node = (WordNode*)malloc(sizeof(WordNode));
    strcpy(new_node->word, word);
    new_node->lines = createLineNode(line_number);
    new_node->next = NULL;
    return new_node;
}

// Función para agregar una palabra a la lista de palabras
WordNode* addWord(WordNode *head, char *word, int line_number) {
    WordNode *current = head;
    WordNode *previous = NULL;
    while (current != NULL && strcmp(current->word, word) != 0) {
        previous = current;
        current = current->next;
    }
    if (current == NULL) {
        WordNode *new_node = createWordNode(word, line_number);
        if (previous == NULL) return new_node;
        previous->next = new_node;
    } else {
        addLine(current, line_number);
    }
    return head;
}

// Función para verificar si una palabra es una "stop word"
int isStopWord(char *word) {
    const char *stop_words[] = {"el", "la", "los", "y", NULL};
    for (int i = 0; stop_words[i] != NULL; i++) {
        if (strcmp(word, stop_words[i]) == 0) return 1;
    }
    return 0;
}

// Función para imprimir las palabras y números de línea
void printWords(WordNode *head) {
    WordNode *current = head;
    while (current != NULL) {
        printf("%s:", current->word);
        LineNode *line = current->lines;
        while (line != NULL) {
            printf(" %d", line->line_number);
            if (line->next != NULL) printf(",");
            line = line->next;
        }
        printf("\n");
        current = current->next;
    }
}

// Función principal
int main() {
    FILE *file = fopen("texto.txt", "r");
    if (file == NULL) {
        perror("No se pudo abrir el archivo");
        return 1;
    }

    WordNode *head = NULL;
    char line[MAX_LINE_LENGTH];
    int line_number = 1;

    while (fgets(line, sizeof(line), file)) {
        char *token = strtok(line, " \n\t.,;:!?\"()");
        while (token != NULL) {
            // Convertir la palabra a minúsculas
            for (int i = 0; token[i]; i++) token[i] = tolower(token[i]);

            if (!isStopWord(token)) {
                head = addWord(head, token, line_number);
            }
            token = strtok(NULL, " \n\t.,;:!?\"()");
        }
        line_number++;
    }

    fclose(file);
    printWords(head);

    return 0;
}
