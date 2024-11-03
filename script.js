// Mock data to simulate the database
let users = [
    { id: 1, name: 'User1', email: 'user1@example.com', password: 'password1', joinDate: '2023-01-01' },
    { id: 2, name: 'Staff1', email: 'staff1@example.com', password: 'staffpassword', role: 'staff' }
];

// Login function to validate user and set logged-in status
function login() {
    const email = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const user = users.find(u => u.email === email && u.password === password);

    if (user) {
        // Set the logged-in user in local storage
        localStorage.setItem('loggedInUser', JSON.stringify(user));

        // Redirect based on user role
        if (user.role === 'staff') {
            window.location.href = "staff.html";
        } else {
            window.location.href = "dashboard.html";
        }
    } else {
        alert("Invalid email or password.");
    }
}

// Display user dashboard - ensure the user is logged in
function displayDashboard() {
    const loggedInUser = JSON.parse(localStorage.getItem('loggedInUser'));

    if (!loggedInUser) {
        // Redirect to login page if user is not logged in
        window.location.href = "index.html";
    } else {
        // Update the static content with the logged-in user data (if logged in)
        document.getElementById("welcomeMessage").textContent = `Welcome, ${loggedInUser.name}!`;
        document.getElementById("userEmail").textContent = `Email: ${loggedInUser.email}`;
        document.getElementById("joinDate").textContent = `Join Date: ${loggedInUser.joinDate}`;
    }
}
