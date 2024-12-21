#!/bin/bash

# Define variables
SRC_DIR="src"
BIN_DIR="bin"
JAR_FILE="MyProgram.jar"
MAIN_CLASS="com.example.Main"

# Create the bin directory if it does not exist
mkdir -p $BIN_DIR

# Compile the Java source files
echo "Compiling Java sources..."
javac -d $BIN_DIR $(find $SRC_DIR -name "*.java")

if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# Create the JAR file
echo "Creating JAR file..."
jar cfe $JAR_FILE $MAIN_CLASS -C $BIN_DIR .

if [ $? -ne 0 ]; then
    echo "Failed to create JAR file."
    exit 1
fi

echo "Build successful. JAR file created: $JAR_FILE"
