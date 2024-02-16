package main

import (
	"bufio"
	"database/sql"
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"

	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

// ANSI color codes
const (
	Black   = "\033[30m"
	Red     = "\033[31m"
	Green   = "\033[32m"
	Yellow  = "\033[33m"
	Blue    = "\033[34m"
	Magenta = "\033[35m"
	Cyan    = "\033[36m"
	White   = "\033[37m"
	Reset   = "\033[0m"
)

func main() {

	// executeCmd := &cobra.Command{
	// 	Use:   "execute",
	// 	Short: "Execute CLI commands step by step",
	// 	Run: func(cmd *cobra.Command, args []string) {
	fmt.Println("Executing CLI commands step by step...")
	getUserInputs()

	// 	},
	// }

	// rootCmd.AddCommand(executeCmd)

	// if err := executeCmd.Execute(); err != nil {
	// 	fmt.Println(err)
	// 	os.Exit(1)
	// }

}
func checkGitHubCLI() {
	cmd := exec.Command("git", "--version")
	err := cmd.Run()
	if err != nil {
		fmt.Println("GitHub is not installed or not in path")
		fmt.Println("Please install all the prerequest")
		os.Exit(1)
	}
	fmt.Println("GitHub is installed")
}

func checkPgsql() {
	cmd := exec.Command("psql", "--version")
	err := cmd.Run()

	if err != nil {
		fmt.Println("PostgreSQL is not installed.")
		fmt.Println("Please install all the prerequest")
		os.Exit(1)
	}

	fmt.Println("PostgreSQL is installed.")
}

func checkGo() {
	checkGo := exec.Command("go", "version")
	er := checkGo.Run()

	if er != nil {
		fmt.Println("Go is not installed.")
		fmt.Println("Please install all the prerequest")
		os.Exit(1)
	} else {
		fmt.Println("Go is installed.")
	}

}

func getUserInputs() {

	// Check Golang is installed or not
	checkGo()

	// Check PostgreSQL is installed or not
	checkPgsql()

	// Check Github is installed or not
	checkGitHubCLI()

	c := exec.Command("go", "env", "-w", "GO111MODULE=off")
	c.Run()
	// Define the Git repository URL and the directory where you want to clone it
	repoURL := "git@github.com:spurtcms/adminpanel.git"
	// If it doesn't exist, clone the repository
	cmd11 := exec.Command("git", "clone", "-b", "main", repoURL)

	// Execute the command
	err := cmd11.Run()
	if err != nil {
		fmt.Println(Red, "Error cloning repository already exist:", Reset, err)
		return
	}
	fmt.Println(Green, "Spurtcms code cloned successfully!", Reset)
	fmt.Println("Please change your database credential,enter your credential one by one.")

	mydir, _ := os.Getwd()
	// fmt.Println("mydir", mydir)
	// Change the working directory of the current process
	err1 := os.Chdir(mydir + "/adminpanel")
	if err1 != nil {
		fmt.Println(Red, "Error changing directory:", Reset, err1)
		return
	}

	// wd, _ := os.Getwd()
	// fmt.Println("mydir1", wd)

	// Load the .env file
	err11 := godotenv.Load(".env")
	if err11 != nil {
		fmt.Println(Red, "Error loading .env file:", Reset, err11)
		return
	}

	// reader := bufio.NewReader(os.Stdin)
	// Prompt user for the first command
	// fmt.Print("Enter the PostgreSQL DB_HOST : ")
	// command1, _ := reader.ReadString('\n')
	// command1 = command1[:len(command1)-1]
	var host, dbName, userName, password string

	// Open a connection to the database.
	for {
		host, dbName, userName, password = GetDbCredential()
		fmt.Println("dbname", dbName)
		// fmt.Println("PostgreSQL database credential changed successfully!")
		// fmt.Println("connection", userName, password, host)
		// Connection string to connect to the PostgreSQL database.
		// Construct the connection string.
		connectionString := fmt.Sprintf("host=%s port=%s user=%s password=%s sslmode=disable",
			host, "5432", userName, password)
		// connStr := "user=" + userName + " password=" + password + " host=" + host + " port=5432 sslmode=disable"
		// fmt.Println("connection String : ", connectionString)
		db, err := sql.Open("postgres", connectionString)
		if err != nil {
			log.Fatal(Red, "Error opening connection to database: ", Reset, err)
		}
		defer db.Close()

		// Ping the database to ensure that the connection is valid.
		err = db.Ping()
		if err != nil {
			// log.Fatal("Error pinging database: ", err)
			fmt.Println(Red, "Given credential was wrong!", Reset, err)
			// host, dbName, userName, password = GetDbCredential()
			continue
		}
		fmt.Println(Green, "Connected to the database.", Reset)
		// Create the database
		_, err = db.Exec("CREATE DATABASE " + dbName)
		if err != nil {
			log.Fatal("Error creating database: ", err)
		}
		fmt.Println(Green, "Database created successfully!", Reset)

		// Define the path to your SQL backup file
		backupFile := mydir + "/spurtcm.sql"
		fmt.Println("backupFile", backupFile)
		// Construct the pg_restore command
		cmd := exec.Command("pg_restore", "-h", host, "-p", "5432", "-d", dbName, "-U", userName, "-w", backupFile)
		// Set the environment variable for password
		cmd.Env = append(cmd.Env, "PGPASSWORD="+password)

		// Execute the pg_restore command
		_, err1 := cmd.CombinedOutput()
		if err1 != nil {
			fmt.Println("Error restoring backup:", err1)
			return
		}
		break
	}

	cmd1 := exec.Command("go", "env", "-w", "GO111MODULE=on")
	cmd1.Run()

	cmd33 := exec.Command("go", "mod", "tidy")
	err2 := cmd33.Run()
	if err2 != nil {
		fmt.Println("Error go mod tidy :", err2)
		return
	}
	cmd55 := exec.Command("go", "mod", "vendor")
	cmd55.Run()
	fmt.Println("Listening and serving HTTP on : " + os.Getenv("DOMAIN_URL"))
	cmd44 := exec.Command("go", "run", "main.go")
	err3 := cmd44.Run()
	if err3 != nil {
		fmt.Println("Error on main function :", err3)
		return
	}
	fmt.Println("Main file run!")
	// Continue with more commands as needed
}

func ChangeEnvContent(key, val string) {
	// Open the .env file
	file, err := os.Open(".env")
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer file.Close()

	// Read the contents of the .env file line by line
	scanner := bufio.NewScanner(file)
	var lines []string
	for scanner.Scan() {
		line := scanner.Text()

		// Modify the line with the desired value
		if strings.HasPrefix(line, key+"=") {
			// fmt.Println("Inside")
			line = key + "='" + val + "'"
		}
		lines = append(lines, line)
	}
	// fmt.Println("Array lines", lines)
	if err := scanner.Err(); err != nil {
		fmt.Println("Error:", err)
		return
	}

	// Write the modified contents back to the .env file
	updatedFile, err := os.Create(".env")
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer updatedFile.Close()

	writer := bufio.NewWriter(updatedFile)
	for _, line := range lines {
		// fmt.Println("Line", line)
		_, err := writer.WriteString(line + "\n")
		if err != nil {
			fmt.Println("Error:", err)
			return
		}
	}
	writer.Flush()
}

func GetDbCredential() (host, dbName, userName, password string) {
	reader := bufio.NewReader(os.Stdin)
	for {

		fmt.Print("Enter the PostgreSQL DB_HOST : ")
		command1, _ := reader.ReadString('\n')
		command1 = command1[:len(command1)-1]
		host = command1
		// fmt.Println("length", len(command1))
		// Split the input into command and arguments
		// parts := strings.Fields(command1)
		if len(command1) == 0 && command1 == "" {

			fmt.Println("Please Enter the postgres DB_HOST credential...!")
			continue
		}

		if len(command1) != 0 {
			ChangeEnvContent("DB_HOST", command1)
			break
		}

	}

	// Prompt user for the second command
	// fmt.Print("Enter the PostgreSQL DB_NAME: ")
	// command2, _ := reader.ReadString('\n')
	// command2 = command2[:len(command2)-1]
	for {

		fmt.Print("Enter the PostgreSQL DB_NAME : ")
		command2, _ := reader.ReadString('\n')
		command2 = command2[:len(command2)-1]
		dbName = command2
		// fmt.Println("length", len(command2))
		// Split the input into command and arguments
		// parts := strings.Fields(command1)
		if len(command2) == 0 && command2 == "" {

			fmt.Println("Please Enter the postgres DB_NAME credential...!")
			continue
		}

		if len(command2) != 0 {
			ChangeEnvContent("DB_NAME", command2)
			break
		}

	}

	// Prompt user for the third command
	// fmt.Print("Enter the PostgreSQL DB_USERNAME: ")
	// command3, _ := reader.ReadString('\n')
	// command3 = command3[:len(command3)-1]
	for {

		fmt.Print("Enter the PostgreSQL DB_USERNAME : ")
		command3, _ := reader.ReadString('\n')
		command3 = command3[:len(command3)-1]
		userName = command3
		// fmt.Println("length", len(command3))
		// Split the input into command and arguments
		// parts := strings.Fields(command1)
		if len(command3) == 0 && command3 == "" {

			fmt.Println("Please Enter the postgres DB_USERNAME credential...!")
			continue
		}

		if len(command3) != 0 {
			ChangeEnvContent("DB_USERNAME", command3)
			break
		}

	}

	// Prompt user for the four command
	// fmt.Print("Enter the PostgreSQL DB_PASSWORD: ")
	// command4, _ := reader.ReadString('\n')
	// command4 = command4[:len(command4)-1]
	for {

		fmt.Print("Enter the PostgreSQL DB_PASSWORD : ")
		command4, _ := reader.ReadString('\n')
		command4 = command4[:len(command4)-1]
		password = command4
		// Split the input into command and arguments
		// parts := strings.Fields(command1)
		// fmt.Println("length", len(command4))
		if len(command4) == 0 && command4 == "" {

			fmt.Println("Please Enter the postgres DB_PASSWORD credential...!")
			continue
		}

		if len(command4) != 0 {
			ChangeEnvContent("DB_PASSWORD", command4)
			break
		}

	}
	return host, dbName, userName, password
}
