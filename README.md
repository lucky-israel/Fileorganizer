# Fileorganizer
Building a GitHub repository clone of a local VM machine file organizer.


This is a script designed to organize files into folders based on their types (e.g., images, documents, others). 


It’s a nice script, manually created as a clone for a local Rocky Linux machine.


The script categorizes files by their extensions, moves them into appropriate directories, and logs all actions, making file management efficient and straightforward.

#PREREQUISITES
* A Linux like operating system (Rocky ,Rhel,Ubunutu)
* Bacic knowledge of Bash shell 
* use a Terminal
* navigate to your directory
* make the script executable
* 
Introduction
The File Organizer Project is a simple yet powerful tool designed to automate the organization of files within a directory. By categorizing files based on their extensions, it creates a neat folder structure, moves files into appropriate directories, and logs the actions performed. This project is ideal for decluttering directories on local machines and can be adapted for various operating systems.

# Project Setup
1. Setting Up the Project Folder:

Create a working folder where the script and files to be organized will reside.
Example:
bash
Copy code
mkdir file-organizer
cd file-organizer
2. Create Necessary Directories:
The script automatically creates directories such as images, documents, and others if they don’t already exist.

3. Organize Files by Extension:
Files are moved to folders based on their extensions. For instance:

Image files (jpg, png, jpeg) are moved to the images folder.
Document files (pdf, doc, docx, txt) are moved to the documents folder.
All other files go to the others folder.
Script Breakdown
The script is structured as follows:

Directory Creation:

Ensures images, documents, and others directories exist:
bash
Copy code
mkdir -p images documents others
Loop Through Files:

Processes all files in the directory while skipping directories and the script itself:
bash
Copy code
for file in *; do
  if [[ -f $file && $file != "organize_files.sh" ]]; then
Categorizing Files by Extension:

Uses a case statement to match file extensions and move files accordingly:
bash
Copy code
case "${file##*.}" in
  jpg|png|jpeg)
    mv "$file" images/
    ;;
  pdf|doc|docx|txt)
    mv "$file" documents/
    ;;
  *)
    mv "$file" others/
    ;;
esac
Logging Actions:

Logs each move operation with a timestamp:
bash
Copy code
echo "$(date): Moved $file to <destination>/" >> organize.log
Completion Message:

Displays a summary after organizing:
bash
Copy code
echo "Files organized into folders! Log saved in organize.log"


 
