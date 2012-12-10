

(defvar cccp-mode-map (make-sparse-keymap) 
"Keymap for cccp minor mode")

(defun template-GL  () "Print out a template for C/C++ programs using OpenGL" 
  (interactive) 
     (insert-string	
      ; 
      ; For those unacquainted with emacs, this type of
      ; formatting of a literal string
      ; is not arduous, because you can define a keyboard macro 
      ; (defaults to F3 and F4, try M-x apropos to find stuff)
      ; that inserts the number of spaces you want, wraps a line in quotes with
      ; newlines and proceeds to the next line. Then you can run 
      ; these keystrokes repeatedly n-times by prefacing the invokation
      ; with C-u and number

      (concat  "/* Using the standard output for fprintf */\n" 
     "#include <stdio.h>\n"
     "#include <stdlib.h>\n"
     "/* Use glew.h instead of gl.h to get all the GL prototypes declared */\n"
     "#include <GL/glew.h>\n"
     "/* Using the GLUT library for the base windowing setup */\n"
     "#include <GL/glut.h>\n"
     "\n"
     "/*  author: Keith Wyss \n"
     "\n"
     "/*----------------- */\n"
     "/*	GLOBALS	    */\n"
     "\n"
     "int init_resources(void)\n"
     "{\n"
     "  /* FILLED IN LATER */\n"
     "}\n"
     "\n"
     "void onDisplay(){\n"
     "  /* FILLED IN LATER */\n"
     "}\n"
     "\n"
     "void free_resources()\n"
     "{\n"
     "  /* FILLED IN LATER */\n"
     "}\n"    
     "int main(int argc, char* argv[]){\n"
     "       glutInit(&argc, argv);\n"
     "  glutInitDisplayMode(GLUT_RGBA|GLUT_DOUBLE|GLUT_DEPTH);\n"
     "  glutInitWindowSize(640, 480);\n"
     "  glutCreateWindow(\"" (read-string "Window name? " nil 'my-history) "\");\n"
     "  \n"
     "  GLenum glew_status glewInit();\n"
     "  if (glew_status != GLEW_OK)\n"
     "  {\n"
     "    fprintf(stderr, \"Error: %s\\n\", glewGetErrorString(glew_status));\n"
     "    return EXIT_FAILURE;\n"
     "  }\n"
     "\n"
     "/* When all init functions runs without errors,\n"
     "   the program can initialize the resources */\n"
     "\n"
     "  if (1 == init_resources())\n"
     "  {\n"
     "    glutDisplayFunc(onDisplay);\n"
     "    glutMainLoop();\n"
     "  }\n"
     "\n"
     "/* if the program exits in the usual way,\n"
     "   free resources and exit with a success. */\n"
     "  free_resources();\n"
     "  return EXIT_SUCCESS;\n"
     "}\n"))
     ;Above we are still just inserting a string
     ;into the buffer

     
     (dotimes (i 2) (previous-line))
)

  (define-key cccp-mode-map (kbd "M--") 'template-GL)



(define-minor-mode cccp-mode
  "This is a minor mode for editing C files.
\\<cccp-mode-map>"
  :lighter " cccp"
  :keymap 'cccp-mode-map
  :after-hook ()
)