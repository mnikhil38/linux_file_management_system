#!/bin/bash

display_menu() {
    echo
    echo "Simple File Management System"
    echo "1. Create a File"
    echo "2. List Files"
    echo "3. Delete a File"
    echo "4. Move a File"
    echo "5. Rename a File"
    echo "6. Exit"
}

create_file() {
    read -p "Enter the filename to create: " filename
    touch "$filename"
    echo "File '$filename' created."
}

list_files() {
    echo "Files in current directory:"
    ls -1
}

delete_file() {
    read -p "Enter the filename to delete: " filename
    if [[ -e $filename ]]; then
        rm "$filename"
        echo "File '$filename' deleted."
    else
        echo "File not found."
    fi
}

move_file() {
    read -p "Enter the filename to move: " source
    read -p "Enter the destination (filename or directory): " destination
    if [[ -e $source ]]; then
        mv "$source" "$destination"
        echo "File '$source' moved to '$destination'."
    else
        echo "File not found."
    fi
}

rename_file() {
    read -p "Enter the current filename: " old_name
    read -p "Enter the new filename: " new_name
    if [[ -e $old_name ]]; then
        mv "$old_name" "$new_name"
        echo "File '$old_name' renamed to '$new_name'."
    else
        echo "File not found."
    fi
}

main() {
    echo "Main function started."  
    while true; do
        display_menu
        read -p "Choose an option: " choice
        case $choice in
            1) 
                echo "Option 1 selected."  
                create_file ;;
            2) 
                echo "Option 2 selected."  
                list_files ;;
            3) 
                echo "Option 3 selected." 
                delete_file ;;
            4) 
                echo "Option 4 selected."  
                move_file ;;
            5) 
                echo "Option 5 selected."  
                rename_file ;;
            6) 
                echo "Exiting the file management system."; break ;;
            *) 
                echo "Invalid option. Please try again." ;;
        esac
    done
}

main

