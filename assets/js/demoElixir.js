const DemoElixir = {
  init(socket) {
    const channel = socket.channel('main:lobby', {})
    channel.join()
    this.listenForChats(channel)
  },

  listenForChats(channel) {
    document.getElementById('chat-form').addEventListener('submit', e => {
      e.preventDefault()

      const userName = document.getElementById('user-name').value
      const userMsg = document.getElementById('user-msg').value

      channel.push('shout', { name: userName, body: userMsg })

      document.getElementById('user-name').value = ''
      document.getElementById('user-msg').value = ''
    })

    channel.on('shout', payload => {
      const chatBox = document.querySelector('#chat-box')
      const msgBlock = document.createElement('p')

      msgBlock.insertAdjacentHTML('beforeend', `<b>${payload.name}:</b> ${payload.body}`)
      chatBox.appendChild(msgBlock)
    })
  }
}

export default DemoElixir