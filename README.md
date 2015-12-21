# SEUD
- This repo will only contain source files. 
- Do not create the project inside the git repo.

## Repo Structure
- seud
    - data
    - report
    - scripts
    - srcs
    - trash
## data
- Holds log files, and other test dat

## report
- Holds report snippets and and figures

## scripts
- Contains a script that performs error injection, detection, and correction.

## scrs
- Contains all design source files

### Constraint
- Different constraint files targeted for the Nexys Video board.

### Healing Core
- Healing core system includes ip and vhdl sources to instantiate the core
    - Import the healing\_core\_system directory into a new project
    - It is recommended however to instantiate a the SEM core for each new project.
        - If you follow this option you have to change the entity name to match rest of the files

### IP Repo
- ip\_repo are ips that can be added to ip based design, such as a microblaze processor system
- se\_single\_core is essentially a non-tmr version of the healing core. 
    - It could be a good starting point to learn about the sub-blocks of the healing core
    
