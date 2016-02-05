# BBOToolkit
Tools for Working with CME Group's Historical BBO Data sets

# Getting started with private repositories

In order to install this toolkit, you will want to generate a personal access token from GitHub, save it to a .Renviron variable called GITHUB_PAT

Steps to get a PAT

1. Go to your account settings on GitHub.com
2. Click 'Personal Access Tokens'
3. Click 'Generate New Token'
4. You will have a long string of numbers that is your token. 

You want to save it in a place that will not be accessible to the public in anyway. For example, you don't want it to get uploaded to a public (or even private) repository. 

Steps to save your PAT in a safe place. 

1. Find out what R's 'home' directory is on your machine. 
    + execute `normalizePath("~/")` in the console. The file identified is where you should save a plain text file called .Renvirion
2. Open .Renviron
3. Type the following: GITHUB_PAT = "StringofnumbersthatisyourPAT"
4. Save .Renviron

Your PAT should be stored in a safe place and accessible from the R console. To check execute the following r code:
`Sys.getenv("GITHUB_PAT")`
You should see your own PAT in the output. 

Now to install the package `BBOToolkit` from [ProfMalloryResearch](https://github.com/ProfMalloryResearch) execute the following r code:

`install_github("ProfMalloryResearch/BBOToolkit", auth_token = Sys.getenv("GITHUB_PAT")) `

