// console.log("Connected Iterval changer")

const banner = document.querySelector(".banner");
const images = [
  "https://images.lifestyleasia.com/wp-content/uploads/2018/08/08101437/Insta-Dessert-21.png?tr=w-1200,h-900",
  "https://imageio.forbes.com/specials-images/imageserve/5f7ca34110dfe853a2be6f5c/0x0.jpg?format=jpg&width=1200",
  "https://culinarylabschool.com/wp-content/uploads/2020/06/baking-and-pastry-school-2-scaled.jpg"
];

let index = 0;

setInterval(() => {
  banner.style.opacity = 0; // Fade out the element
  setTimeout(() => {
    banner.style.backgroundImage = `linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)), url('${images[index]}')`; // Set the background image URL
    banner.style.opacity = 1; // Fade in the element
    index = (index + 1) % images.length; // Increment the index and wrap around if necessary
  }, 1000);
}, 5000);
