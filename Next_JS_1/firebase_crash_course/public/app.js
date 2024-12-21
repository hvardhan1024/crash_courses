import { initializeApp } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-app.js";
import { getAuth, GoogleAuthProvider, signInWithPopup, signOut, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-auth.js";
import firebaseConfig from "./firebaseConfig.js";

console.log(firebaseConfig);

  
// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);


// DOM elements
const whenSignedIn = document.getElementById("whenSignedIn");
const whenSignedOut = document.getElementById("whenSignedOut");

const signInBtn = document.getElementById("signInBtn");
const signOutBtn = document.getElementById("signOutBtn");

const userDetails = document.getElementById("userDetails");

// Google Auth provider
const provider = new GoogleAuthProvider();

// Sign in event handlers
signInBtn.onclick = () => signInWithPopup(auth, provider).catch((error) => {
  console.error("Sign-in error:", error.message);
});

signOutBtn.onclick = () => signOut(auth).catch((error) => {
  console.error("Sign-out error:", error.message);
});

// Auth state listener
onAuthStateChanged(auth, (user) => {
    if (user) {
      whenSignedIn.hidden = false;
      whenSignedOut.hidden = true;
      userDetails.innerHTML = `<h3>Hello ${user.displayName}</h3>`;
    } else {
      whenSignedIn.hidden = true;
      whenSignedOut.hidden = false;
      userDetails.innerHTML = "";
    }
  });

