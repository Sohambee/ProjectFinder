const Project = {
  initialize() {
    $(document).on('turbolinks:load', () => {
      if (window.location.pathname.includes("edit")) {

        let c = $("#categoryArr").val() != "[]" ? JSON.parse($("#categoryArr").val()) : []
        $("#categoryArr").val(c)
        c.map((item, index) => {
          let temp = index
          $("#categories").append(`
              <div id= ${"d" + temp} class="mb-8  w-auto">
                <div class="flex items-center h-5 mt-4">
                    <label id=${"b" + temp} class="mr-6 font-medium text-gray-700">Category: ${item}</label>
                    <button id=${"c" + temp} value=${temp} style = "max-height:40px;" class="p-2 block text-black justify-end w-auto bg-red-100 hover:bg-gray-300 cursor-pointer removeValue" > Remove</button>
                </div>
              </div>  

        `)

          $(`#${"c" + temp}`).on('click', (ev) => {
            ev.preventDefault();
            ev.stopPropagation();
            let categories = $("#categoryArr").val() != "[]" ? $("#categoryArr").val().replace(/[\[\]']+/g, '').replace("/", "").split(",") : []
            let category = $(`${"b" + temp}`).html()
            categories = categories.map((item2) => {
              if (item2 != category) return item2
            })
            $("#categoryArr").val(categories)
            $(`#${"d" + temp}`).remove()
          })
        })
      }

      function onOtherSelect(selectBox) {
        if ($(selectBox).find(":selected").text().trim().toUpperCase() == "OTHER") {
          $('.other-input').show();
        }
        else {
          $('.other-input').hide();
          $('.other-input').val(""); //clear out the value if required
        }
      }

      $('.not-accepting-volunteers').on('click', function (ev) {
        Project.notAcceptingVolunteers(this, ev);
      });

      $('.volunteer-with-skills').on('click', function (ev) {
        Project.volunteerWithSkills(this, ev);

        $('#volunteer_note').on('change', function () {
          if (this.value == "Other") {
            $('.other-input').show(200);
          }
        });
      });

      $('.volunteer-without-skills').on('click', function (ev) {
        Project.volunteerWithSkills(this, ev);

        $('#volunteer_note').on('change', function () {
          if (this.value == "Other") {
            $('.other-input').show(200);
          }
        });
      });
      $('.send-message').on('click', function (ev) {
        Project.sendMessage(this, ev);
      });
      $('.search_button').on('click', function (ev) {

        Project.searchImage(this, ev);
      });
      $('#search_categories').on('input', function (e) {

        Project.searchCategories(this, e);
      });
      $('.chooseContent').on('click', function (ev) {

        Project.chooseCategory(this, ev);
      });

      $('.removeValue').on('click', function (ev) {
        ev.preventDefault();
        ev.stopPropagation();
      })

      $('#addCategory').on('click', function (ev) {
        ev.preventDefault();
        ev.stopPropagation();
        let categories = $("#categoryArr").val() != "[]" ? $("#categoryArr").val().replace(/[\[\]']+/g, '').replace("/", "").split(",") : []
        console.log($("#categoryArr").val())
        console.log(categories);
        if (!categories.includes($(`#search_categories`).val()) && $(`#search_categories`).val() != "") {
          categories.push($(`#search_categories`).val())
          console.log(categories)
          $("#categoryArr").val(categories)
          let temp = window.localStorage.getItem("inc") || 0
          $("#categories").append(`
              <div id= ${"d" + temp} class="mb-8  w-auto">
                <div class="flex items-center h-5 mt-4">
                    <label id=${"b" + temp} class="mr-6 font-medium text-gray-700">Category: ${$(`#search_categories`).val()}</label>
                    <button id=${"c" + temp} value=${temp} class="p-2 block text-black justify-end w-auto bg-red-100 hover:bg-gray-300 cursor-pointer removeValue" > Remove</button>
                </div>
              </div>  

        `)

          $(`#${"c" + temp}`).on('click', (ev) => {
            ev.preventDefault();
            ev.stopPropagation();
            console.log($("#categoryArr").val())
            let categories = $("#categoryArr").val() != "[]" ? $("#categoryArr").val().replace(/[\[\]']+/g, '').replace("/", "").split(",") : []
            let category = $(`${"b" + temp}`).html()
            categories = categories.map((item) => {
              if (item != category) return item
            })
            $("#categoryArr").val(categories)
            $(`#${"d" + temp}`).remove()
          })

          window.localStorage.setItem("inc", parseInt(temp) + 1)
          $('#search_categories').val("")
          $('#search_categories').blur();
          $("#add_search").html("")
        }

      })

    });
  },

  notAcceptingVolunteers(that, ev) {
    ev.preventDefault();
    ev.stopPropagation();

    const targetHref = $(that).attr('href');

    const headerHTML = I18n.t('this_project_is_not_accepting_volunteers');
    const bodyHTML = I18n.t('we_re_sorry_this_project_has_indicated_no_volunteers');

    Covid.showModal(headerHTML, bodyHTML, [{ type: 'cancel', text: 'OK' }], 'warning');

    return false;
  },

  volunteerWithSkills(that, ev) {
    ev.preventDefault();
    ev.stopPropagation();

    const targetHref = $(that).attr('href');


    const headerHTML = "You are going to use this project"
    const bodyHTML = `
      You can enter the reason you are using this project
      <br>
      <div class="mt-3">
        <label for="volunteer_note" class="sr-only">${I18n.t('volunteer_note')}</label>
        <div class="relative rounded-md shadow-sm">
          <select id="volunteer_note" class="form-input block w-full sm:text-sm sm:leading-5" placeholder="I am using this project for personal reasons" >
              <option value="Course Assignment">Course Assignment</option>
              <option value="Course Project">Course Project</option>
              <option value="Personal Project">Personal Project</option>
              <option value="Other">Other</option>
          </select>
        </div>
        <input id="otherReason" class="other-input mt-4 h-8 w-full pl-3 border rounded" hidden type=text placeholder="Reason" />
      </div>
      `;

    const callback = () => {
      let volunteerNote;
      if ($("#volunteer_note").val() == "Other") {
        volunteerNote = $("#otherReason").val();
      } else {
        volunteerNote = $("#volunteer_note").val();
      }
      $.post(targetHref, { note: volunteerNote });
    }

    Covid.showModal(headerHTML, bodyHTML, [{ type: 'cancel' }, { type: 'submit', text: "Use project", callback }], 'warning');

    return false;
  },

  volunteerWithoutSkills(that, ev) {
    ev.preventDefault();
    ev.stopPropagation();

    const targetHref = $(that).attr('href');
    const skillsRequired = $(that).attr('x-skills-required');

    const headerHTML = I18n.t('you_re_missing_skills');
    const bodyHTML = I18n.t('skills_needed_do_not_match', { skills_required: skillsRequired });

    const callback = () => window.location.href = targetHref;
    Covid.showModal(headerHTML, bodyHTML, [{ type: 'cancel' }, { type: 'submit', text: I18n.t('edit_profile'), callback }], 'warning');

    return false;
  },

  sendMessage(that, ev) {
    ev.preventDefault();
    ev.stopPropagation();

    const targetHref = $(that).attr('href');

    const sender_id = $(that).attr('sender_id');
    const reciever_id = $(that).attr('reciever_id');


    console.log(sender_id, reciever_id)
    const headerHTML = "Send a message to this post owner"
    const bodyHTML = `
      Send a message
      <br>
      <div class="mt-3">
        <label for="message" class="sr-only">Send Message</label>
        <div class="relative rounded-md shadow-sm">
        <input id="message" class="form-input block w-full sm:text-sm sm:leading-5" placeholder="Enter a message" />
      </div>
      </div>
      `;

    const callback = () => {
      const message = $("#message").val();
      console.log(message)
      $.get(targetHref);
    }

    Covid.showModal(headerHTML, bodyHTML, [{ type: 'cancel' }, { type: 'submit', text: "Send message", callback }], 'warning');

    return false;
  },
  searchImage(that, ev) {
    ev.preventDefault();
    ev.stopPropagation();
    let query = $(".image_search").val();

    $.ajax({
      method: 'GET',
      url: 'https://api.unsplash.com/search/photos',
      data: {
        query,
        per_page: 4,
        page: 0
      },
      headers: {
        Authorization: `Client-ID OfKz0HLoXdei0YGzuyPAqiFaMOSFk3eMhBIKBEDIz2Y`
      },
      success: function (data) {
        let urls = data.results
        console.log(data)
        console.log(data.results)
        onSuccess(urls)
      }
    })

    const onSuccess = (urls) => {
      const headerHTML = "Choose image to display"

      console.log(urls)
      var bodyHTML = `
      Send a message
      <br>
      <div class="mt-3 flex flex-wrap ">
        <label for="message" class="sr-only">Choose image</label>
        
      `
      urls.forEach((result, index) => {
        if (index == 0)
          bodyHTML += `<label>
                        <input type="radio" name="test" value=${result.urls.regular} checked>
                        <img src=${result.urls.thumb} >
                  </label>`
        else bodyHTML += `<label>
                        <input type="radio" name="test" value=${result.urls.thumb}>
                        <img src=${result.urls.thumb} >
                    </label>`
      });

      bodyHTML += `</div> </div>`
      const callback = () => {
        let val = $('input[name="test"]:checked').val();
        $("#display_image").html(`<img src=${val}>`)
        $(".change_val").val(val)
      }

      Covid.showModal(headerHTML, bodyHTML, [{ type: 'cancel' }, { type: 'cancel', text: "Choose Image", callback }], 'warning');
    }
    return false;
  },


  // searchCategories(that, ev) {


  //   ev.preventDefault();
  //   ev.stopPropagation();

  //   let query = $(that).val();
  //   if ($(that).is(":focus")) {
  //     $.ajax({
  //       method: 'GET',
  //       url: "/categories/getCategories/" + query,
  //       success: function (data) {

  //         let arr = []
  //         $("#add_search").html("")
  //         data.categories.map((item, index) => {
  //           $("#add_search").append(
  //             `  <button id=${index} class="p-2 block text-black w-full hover:bg-gray-300 cursor-pointer chooseContent">${item.category}</button>
  //               `
  //           )

  //           $(`#${index}`).on('click', (ev) => {
  //             ev.preventDefault();
  //             ev.stopPropagation();
  //             let categories = $("#categoryArr").val() != "[]" ? $("#categoryArr").val().replace(/[\[\]'"]+/g, '').replace("/", "").split(",") : []


  //             console.log(categories)
  //             if (!categories.includes($(`#${index}`).html())) {
  //               categories.push($(`#${index}`).html())
  //               console.log(categories)
  //               $("#categoryArr").val(categories)
  //               let temp = window.localStorage.getItem("inc") || 0
  //               $("#categories").append(`
  //                   <div id= ${"d" + temp} class="mb-8 w-auto">
  //                     <div class="flex items-center h-5">
  //                         <label id=${"b" + temp} class="font-medium mr-6 text-gray-700">Category: ${$(`#${index}`).html()}</label>
  //                         <button id=${"c" + temp} style = "max-height:40px;"  class="p-2 block text-black bg-red-100 hover:bg-gray-300 cursor-pointer removeValue" > Remove</button>
  //                     </div>
  //                   </div>  
      
  //             `)

  //               $(`#${"c" + temp}`).on('click', (ev) => {
  //                 ev.preventDefault();
  //                 ev.stopPropagation();
  //                 console.log($("#categoryArr").val())
  //                 let categories = $("#categoryArr").val() != "[]" ? $("#categoryArr").val().replace(/[\[\]'"]+/g, '').replace("/", "").split(",") : []
  //                 let category = $(`${"b" + temp}`).html()
  //                 categories = categories.map((item) => {
  //                   if (item != category) return item
  //                 })
  //                 $("#categoryArr").val(categories)
  //                 $(`#${"d" + temp}`).remove()
  //               })

  //               window.localStorage.setItem("inc", parseInt(temp) + 1)
  //               $('#search_categories').val("")
  //               $('#search_categories').blur();
  //               $("#add_search").html("")
  //             }
  //           })
  //         })
  //       }
  //     })
  //   }
  // },
}



export default Project