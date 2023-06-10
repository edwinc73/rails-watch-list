import { Controller } from "@hotwired/stimulus"

import JSConfetti from 'js-confetti'

export default class extends Controller {

  connect() {
    const jsConfetti = new JSConfetti()
    jsConfetti.addConfetti({
      emojis: ['✨'],
      confettiRadius: 1,
      confettiNumber: 200,
   })
  }
}
