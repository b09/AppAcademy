const MessageStore = require('./message_store');

module.exports = {
  render() {
    let container = document.createElement("ul");
    let messages = MessageStore.getInboxMessages();

    container.className = "messages";
    messages.forEach( message => {
      container.appendChild(this.renderMessage(message));
    });

    return container;
  },

  renderMessage(message) {
    let el = document.createElement("li");
    el.className = "message";
    el.innerHTML = `<span class="from">${message.from}</span>
                    <span class="subject">${message.subject}</span> -
                    <span class="body">${message.body}</span>`;
    return el;
  }
};
