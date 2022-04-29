# Mcode-Github-Action

Github Action to test the compilation of M code routines

This action searches a repo for files with a **.m** extension and then attempts to compile the routines in YottaDB returning the output. This forms an integral part of a CI/CD pipeline.

# Inputs

**repo** - The repo to pull and find the routines in. (default https://github.com/RamSailopal/Mcode-Github-Action.git)

**gituser** - The username for a private repo (default blank - assumes a public repo)

**gitpass** - The password for a private repo (default blank - assumes a public repo)


# Example workflow:

     jobs:
      m_routine_compilation_job:
        runs-on: ubuntu-latest
        name: Check M code by compliing it
        steps:

         - name: M routine compilation check step
           uses: RamSailopal/Mcode-Github-Action@v1
           with:
             repo: 'https://github.com/RamSailopal/Mcode-Github-Action.git'
             gituser: 'tom'
             gitpassL 'smith'
            

             

           

