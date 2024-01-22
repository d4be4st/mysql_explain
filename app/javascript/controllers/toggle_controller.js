import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static outlets = [ 'toggle' ]
  static values = { id: Number, status: String }
  static targets = [ 'indicator' ]

  toggle(event) {
    if(this.statusValue == "expanded")
      this.hide(event)
    else
      this.show(event)
  }

  hide(event) {
    this.toggleOutlets.filter(outlet => {
      return event.params.children.includes(outlet.idValue)
    }
    ).forEach(outlet =>
      outlet.element.hidden = true
    )
    this.statusValue = "collapsed"
    this.indicatorTarget.innerText = '+'
  }

  show(event) {
    this.toggleOutlets.filter(outlet => {
      return event.params.children.includes(outlet.idValue)
    }
    ).forEach(outlet =>
      outlet.element.hidden = false
    )
    this.statusValue = "expanded"
    this.indicatorTarget.innerText = '-'
  }
}
