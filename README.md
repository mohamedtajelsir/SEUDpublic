# SEUD: Single Event Upset Detector Experiment Project Files
- This repo will only contain source files. 
- Do not create projects inside the git repo.
- Repo maintainer and scripts creator: Youssef (youssefz@kth.se)
- Custom IP creator: Tage (mtme@kth.se)

## Repo Structure
- seud
    - data
    - report
    - scripts
    - hc_srcs
    - XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter
    - trash

## data
- Holds log files, and other test data

## report
- Holds report snippets and and figures

## scripts
- Contains a script that performs error injection, detection, and correction.

## hc_scrs
- Contains all design source files for the healing core

### constraint
- Different constraint files targeted for the Nexys Video board.

### healing core
- Healing core system includes ip and vhdl sources to instantiate the core
    - Import the healing\_core\_system directory into a new project
    - It is recommended however to instantiate a the SEM core for each new project.
        - If you follow this option you have to change the entity name to match rest of the files

## ip repo
- ip\_repo are ips that can be added to ip based design, such as a tmr majority voter, tmr integrity timer, memory conformity module, AXI tmr voter to work with microblaze processor system
- se\_single\_core is essentially a non-tmr version of the healing core. 

## XA200T\_TMRMBwGPO\_TMRMBwUART\_ThroughVoter:
    - A complete design example for all system blocks. It could be a good starting point for further improvements.
    
## trash
- This is a recycling bin for code.
