# **Workout Scheduler CLI**

Workout CLI is a lightweight and customizable command-line tool for tracking and managing your workout routine. It leverages simple shell functions to interact with a script that performs core operations such as displaying, logging, and resetting workout progress.

---

## **Features**
- **`wshow`**: Displays your workout schedule or progress.
- **`wdone`**: Logs a completed workout session.
- **`wreset`**: Resets your workout progress.

---

## **Setup Instructions**

### Prerequisites
1. A Unix-based environment (Linux/MacOS or WSL for Windows).
2. Bash shell installed.
3. Basic understanding of shell scripting.

---

### Step 1: Clone this repository
Clone the repository to set up the script locally in the `$HOME`:
```bash
cd
git clone https://github.com/abinashlingank/.workoutScheduler.git
```

---

### Step 2: Install the CLI
1. Giving permission for `workoutScript.sh` and make it as executable:
   ```bash
   cd
   chmod +x $HOME/.workoutScheduler/workoutScript.sh
   ```

2. Append the following functions to your `.bashrc` or `.zshrc` file:
   ```bash
   # Workout CLI
   function wshow() {
       (cd \$HOME/.workoutScheduler && ./workoutScript.sh show)
   }
   function wdone() {
       (cd \$HOME/.workoutScheduler && ./workoutScript.sh did)
   }
   function wreset() {
       (cd \$HOME/.workoutScheduler && ./workoutScript.sh reset)
   }
   ```

   Use the following command to add these functions automatically:
   ```bash
   cat << EOF >> ~/.bashrc
   # Workout CLI
   function wshow() {
       (cd \$HOME/.workoutScheduler && ./workoutScript.sh show)
   }
   function wdone() {
       (cd \$HOME/.workoutScheduler && ./workoutScript.sh did)
   }
   function wreset() {
       (cd \$HOME/.workoutScheduler && ./workoutScript.sh reset)
   }
   EOF
   ```

3. Reload your shell configuration to apply the changes:
   ```bash
   source ~/.bashrc
   ```

---

## **Usage**
Once installed, you can use the following commands in your terminal:

- **View your workout schedule**:
  ```bash
  wshow
  ```

- **Log a completed workout session**:
  ```bash
  wdone
  ```

- **Reset your workout progress**:
  ```bash
  wreset
  ```

---

## **Customizing the Script**
The `workoutScript.sh` file contains the logic for handling the commands. You can modify it to fit your specific workflow or add additional features.

Example content of `workoutScript.sh`:
```bash
#!/bin/bash

case $1 in
  show)
    echo "Displaying workout schedule..."
    # Add your logic here
    ;;
  did)
    echo "Workout completed and logged!"
    # Add your logic here
    ;;
  reset)
    echo "Workout progress reset!"
    # Add your logic here
    ;;
  *)
    echo "Invalid command. Use: show | did | reset"
    ;;
esac
```

---

## **Uninstalling the CLI**
1. Remove the `.workoutScheduler` directory:
   ```bash
   rm -rf $HOME/.workoutScheduler
   ```

2. Remove the CLI functions from your `.bashrc`:
   Open `.bashrc` and delete the `Workout CLI` block, or use:
   ```bash
   sed -i '/# Workout CLI/,/^$/d' ~/.bashrc
   ```

3. Reload your shell configuration:
   ```bash
   source ~/.bashrc
   ```

---

## **Contributing**
Feel free to submit issues or pull requests to enhance functionality or fix bugs.


---

Happy tracking your workouts! 💪
