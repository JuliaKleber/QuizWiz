import { Controller } from "@hotwired/stimulus"
import playQuiz from 'stimulus-play-quiz'

// Connects to data-controller="play-quiz"
export default class extends Controller {
  connect() {
  }

  advance() {
    this.swiper.allowSlideNext = true;
  }
}

// Using on method after swiper initialization.

// const swiper = new Swiper('.swiper-container', {
//   // ...
// });
// swiper.on('slideChange', function () {
//   console.log('slide changed');
// });
