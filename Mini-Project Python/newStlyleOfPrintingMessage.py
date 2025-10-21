import string  # Importing the lowercase alphabet (a-z)

word = 'cbg'  # The word you want to process

mat = []      # This will store the final 2D list (list of lists)
new1 = []     # Temporary list to collect letters for each character in the word

# Loop through each character in the word by index
for each in range(len(word)):
    
    # Loop through all lowercase letters
    for x in string.ascii_lowercase:
        new1.append(x)       # Add current letter to temporary list
        print(new1)          # Print current state of the temporary list
        
        # If current letter matches the target letter in the word
        if word[each] == x:
            mat.append(new1)  # Add the collected list to the matrix
            new1 = []         # Reset the temporary list for the next round, remove this and y will see a bug
            break             # Exit the loop as we've reached the needed letter
    
    print('\n')  # Separate output visually for each character's processing


print('------------------------------------')

# Print the final matrix row by row
for each in range(len(mat)):
    print(mat[each], '\n')  # Print each sublist in the matrix
