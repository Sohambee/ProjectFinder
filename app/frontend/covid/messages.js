const Messages = {
  initialize() {
    var message;
    $(document).on('turbolinks:load', () => {

      $('#convo').ready(function (ev) {
        var d = $('#inside_convo');
        d.scrollTop(d.prop("scrollHeight"));
        clearInterval(message)

        const conversationID = window.location.pathname.split("/")[2]
        if (window.location.pathname.split("/")[1] == "conversations") message = setInterval(function () {

          if (window.location.pathname.split("/")[1] == "conversations") {
            $.ajax({
              method: 'GET',
              url: window.location.pathname + "/getData",
              success: function (data) {
                let arr = []
                let messArr = []
                arr = data.conversations.map((item) => {
                  messArr = data.messages
                  let lastMessage = messArr.slice(-1)
                  console.log(lastMessage)
                  let user = ""
                  let innerInfor = ""
                  let classname = ""
                  let link = ""

                  if (item.id == conversationID)
                    classname = "px-2 divide-y flex space-x-2 border rounded overflow-hidden outline-none focus:outline-none bg-gray-200 w-24 sm:w-60"
                  else
                    classname = "px-2 divide-y bg-white-100 overflow-hidden flex space-x-2 hover:bg-gray-200 focus:outline-none focus:bg-gray-200 w-24 sm:w-60"

                  link = `/conversations/${item.id}/messages`

                  if (item.sender_id == data.user) user = item.reciever_name
                  else user = item.sender_name


                  if (item.body) {
                    if (item.read || item.user_id == data.user) {
                      if (item.user_id == data.user) {
                        innerInfor = `<div>You: ${item.body.slice(0, 22)} | ${String(lastMessage[0].created_at).split("T")[0]}</div>`
                      } else {
                        innerInfor = `<div>${item.body.slice(0, 22)} | ${String(lastMessage[0].created_at).split("T")[0]}</div>`
                      }
                    } else innerInfor = `<div class="font-bold">${item.body.slice(0, 22)} | ${String(lastMessage[0].created_at).split("T")[0]}</div>`
                  } else innerInfor = `<div>No messages exchanged!</div>`

                  let inner = `
                  <a href=${link} class="${classname} outline-none">
                    <button>
                    <div class=" flex flex-col items-start " style = "max-height:61px; text-overflow: ellipsis;">
                      <div class="text-lg font-extralight" >
                        ${user}
                      </div>
                      <div class="flex text-xs space-x-1 truncate">
                        ${innerInfor}
                      </div>
                    </div>
                    </button>
                  </a>
                  `

                  return inner
                })

                messArr = data.messages.map((message) => {
                  let inner = ""
                  if (message.body) {
                    if (message.user_id == data.user) {
                      inner = `
                    <div class="flex justify-end" >
                      <div class="flex items-end space-x-2 justify-end right-0" style = "max-width:600px;">
                        <div class="bg-primary-600 text-white px-4 py-2 p-100 rounded-lg break-words">
                          ${message.body}
                        </div>
                      </div>
                    </div>
                    <div class="flex justify-end mb-5" >
                      <p class=" text-xs mb-3 text-gray-500">${String(message.created_at).split("T")[0]}</p>
                    </div>
                  `
                    }
                    else {
                      inner = `
                    <div class="flex justify-start">
                      <div class="flex items-start space-x-2 justify-start right-0" style = "max-width:600px;">
                        <div class="bg-gray-200 text-black px-4 py-2 w-auto rounded-lg text-white break-words" style = "max-width:600px;">
                        ${message.body}
                        </div>
                      </div>
                    </div>
                    <div class="flex justify-start mb-5">
                      <p class="text-xs text-gray-500 mb-3">${String(message.created_at).split("T")[0]}</p>
                    </div>
                  `
                    }
                  }
                  return inner
                })
                $('#allConvos').html(arr)
                $('#inside_convo').html(messArr)
              }
            })
          }

        }, 2000);
      });



      // $('#convo').unload(function (ev) {
      //     clearInterval(messages)
      // })
    });

    $(document).on('page:beforeout', function () {
      clearInterval(message)
    });


    $(window).bind('beforeunload', function () {
      clearInterval(message)
    });
  }

}


export default Messages