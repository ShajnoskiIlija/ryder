import {Controller} from "stimulus"

  export default class extends Controller {
    static targets = [ 'flashdisplay' ]

    connect(){
        setTimeout(() => this.flashClose(), 3000)
    }

    flashClose() {
      this.flashdisplayTarget.classList.add("hidden")
    }

  }