import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    console.log(`Connected to Channel ${this.chatroomIdValue}`)
    // console.log(this.chatroomIdValue)
    this.channel = createConsumer().subscriptions.create(
      { channel: 'ChatroomChannel', id: this.chatroomIdValue },
      { received: (data) => { this.#insertMessage(data) } }
    )
  }

  disconnect() {
    console.log('Disconnected from Channel')
    this.channel.unsubscribe()
  }

  resetForm(event) {
    const form = event.target
    form.reset()
  }

  // private methods
  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML('beforeend', data)
    // scroll to bottom of list
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
