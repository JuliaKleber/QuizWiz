import { Controller } from '@hotwired/stimulus'
import swiper from 'swiper'

const getDataToHtmlForm = () => {
  console.log('Done!');
  // Target in view needed where we can send the UserPicks to
};

// Connects to data-controller="play-quiz"
export default class extends Controller {

  static values = { questionsIds: Array }

  static targets = ['userGuesses'];

  connect() {
    console.log('hi')
    this.swiper = new swiper(this.element);
    this.count = 0;
    this.userPicks = [];

    this.swiper.on('slideChange', function () {
      console.log('slide changed');
    });
  }

  advance(event) {
    this.count++;

    let userPick = 'choice_two';
    if (event.target.classList.contains("choice-one")) {
      userPick = 'choice_one';
    }
    this.userPicks.push(userPick);

    const numberQuestions = this.questionsIdsValue.length;

    console.log('------------------');
    console.log(numberQuestions);
    console.log(this.count);
    console.log('------------------');
    console.log(this.questionsIdsValue);
    console.log(this.userPicks);

    if (this.count === numberQuestions) {
      getDataToHtmlForm();
    } else {
      this.swiper.slideNext()
    }
  }
}
