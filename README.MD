
🚀 Minimal Node.js Hello World 🌍
=================================

Welcome to the **Minimal Node.js Hello World** repository! This is a simple Node.js application that prints **"Hello, World!"** and serves it via an HTTP server.

This repository also explores different ways to **deploy** the application.

* * *

📌 Features
-----------

*   ⚡ **Lightweight & Minimal**

*   🌍 **Runs Locally & In Containers**

*   🚢 **Easily Deployable Anywhere**

* * *

🏃‍♂️ Run Locally
-----------------

3.  **Clone the Repository**  
    
        git clone https://github.com/beniye19/simple-node-app
    

\`\`\`

### 2️⃣ Install Dependencies

    cd simple-node-app
    npm install

\`\`\`

### 3️⃣ Start the Application

    npm start

\`\`\`

### 4️⃣ Access the App

Open your browser and visit: **http://localhost:3000**

* * *

\`\`\`

🐳 Run in a Docker Container
----------------------------

\`\`\`

### 1️⃣ Build the Docker Image

    docker build -t node-hello-world:latest .

\`\`\`

### 2️⃣ Run the Container

    docker run -it -p 3000:3000 --name node-hello-world node-hello-world:latest

\`\`\`

### 3️⃣ Verify It's Running

Open your browser and visit: **http://localhost:3000**

* * *


\`\`\`

### 🤝 Contributing

Feel free to fork this repo, create a branch, and submit a pull request!

* * *

⚖️ License
----------

This project is open-source and available under the **MIT License**.

* * *

🌟 **Star this repo if you found it helpful!** 🚀