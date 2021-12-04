# **Mcdonalds Project 6 - Peer Evaluation Tool**
In this project, we design a peer evaluation tool to help students to provide feedback for each project.

# **Overview**
In this tool, the landing page will be the administrator sign up page. 


![Admin_page](https://user-images.githubusercontent.com/70242213/144694978-29b6e9a8-8686-416c-bcf7-1d4075329185.png)

-For the administrator:

**Only the administrator can sign up for an account.** 

To sign up for an account, administrators will be required to enter their name, email, password and password confirmation. 

To sign in the account, click on "Already have an account?" and enter your email and password.

Then the administrator will create students account, which will require the administrators to enter the students name, email, password. The administrator can also create groups and project by clicking on the corrsponding button on the navigation bar.

-For the students:
To sign in the account, they can click on the "Already have an account?" button and enter your email and password.




# **Requirement**
To set up,please first clone the repository by 

    git clone https://github.com/cse3901-2021au-giles/mcdonalds-project6.git

To get all dependencies required for the project, please install these gems into your command line before running: 

    bundle install


Migrate the database:

    rails db:migrate
    
Install webpacker:

    rails webpacker:install
  
Then run the rails server:
 
    rails server
    
To visit the website, open the browser andd type: 

    localhost:3000
    
# **Introduction**:

## Models

-admin-administrators

-user-students

-evaluation

-group

-project


## Views

-Admin View

-User View

-Shared View


## Controllers


 
# **Testing**

