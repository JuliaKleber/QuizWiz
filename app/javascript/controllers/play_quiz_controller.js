import { Controller } from '@hotwired/stimulus'
import swiper from 'swiper'

const getDataToHtmlForm = () => {
  console.log('Done!');
  // Target in view needed where we can send the UserPicks to
};

// Connects to data-controller="play-quiz"
export default class extends Controller {

  static values = { questionsIds: Array }
  static targets = ['submitResults'];

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
      this.submitResultsTarget.classList.remove("d-none");
      // getDataToHtmlForm();
    }
    this.swiper.slideNext();

  }

  submit(e) {
    const body = e.formData;
    const values = []
    for (let i = 0; i < this.questionsIdsValue.length; i++) {
      values.push([this.questionsIdsValue[i], this.userPicks[i]].join(" "))
    }
    body.append("user_picks", values.join(";"))
    console.log(body);

    // this.submitResultsTarget.values(body).submit()

    // const options = {
    //   method: "POST",
    //   headers: { Accept: "application/html" },
    //   body: body,
    // }

    // fetch(this.submitResultsTarget, options)
  }
}
