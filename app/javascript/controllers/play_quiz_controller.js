import { Controller } from '@hotwired/stimulus'
import swiper from 'swiper'

// const questions = document.querySelectorAll(".swiper-wrapper")

// Connects to data-controller="play-quiz"
export default class extends Controller {

  // static targets = ["button1", "button2"]

  connect() {
    console.log('hi')
    this.swiper = new swiper(this.element);
    // questions.forEach((question, i)=>{
    //   console.log("hi")
    //   if( i !=0 ) {
    //     question.classList.add('hidden')}
    // })

    this.swiper.on('slideChange', function () {
      console.log('slide changed');
    });
  }

  advance() {
    this.swiper.slideNext();
    // this.button1Target.innerText;
    // this.button2Target.innerText;
    
    // # let results = 0
    // # user_guesses.foreach do | user_guess |
    // # if user_guess.is_correct?
    // # results += 1
  }
}

// Using on method after swiper initialization.

// const swiper = new Swiper('.swiper-container', {
//   // ...
// });
// swiper.on('slideChange', function () {
//   console.log('slide changed');
// });
