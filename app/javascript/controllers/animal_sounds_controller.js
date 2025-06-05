import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { sound: String }

  play(event) {
    const audio = new Audio(this.soundValue)
    audio.play()
    setTimeout(function(){
        audio.pause();
        audio.currentTime = 0;
    }, 2000);
  }

}
