# A Label -> is a name followed by a colon (:)
# It represents the address of the instruction or data that follows it.

# Example:
# label_name:    
#       Instructions or data follow

# Usage of Labels :
# =================
# 1. labels in Instructions :
# ---------------------------
# Labels are commonly used to identify targets for branching and jumping instructions, such as 
# j, beq, and bne.

# 2. Labels for loops : 
# ---------------------
# Labels are also useful in implementing loops.

# 3. Labels in Data Segments :
# ----------------------------
# Labels in the .data section are used to declare memory locations for variables.

# labels must be: Descriptive, Unique & Aligned with Purpose.

# Example :
# =========

loop_start:
    # Instructions
    j loop_start # return to the start
    

