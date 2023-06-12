import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const currentPage = window.location.pathname;
    const navLinks = document.querySelectorAll(".nav-links > a");
    navLinks.forEach((link)=>{
      const linkValue = link.attributes.href.value
      if(linkValue == currentPage){
        const highlight = document.querySelector(".nav-active::after")
        highlight.style.opacity("1")
      } else if(link.classList.value.includes("nav-active")) {
        link.classList.remove("nav-active")
      }
    })
  }
}
