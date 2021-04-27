document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      if(this.currentStep === 2){
        const prevButton = document.querySelector("#prevButtonStep1");
        if (showCategoryCheck().length === 0) {
          alert("Musisz wybrać kategorię");
          prevButton.click();
          return false;
        }
      }

      if(this.currentStep === 3){
        const quantity = document.querySelector("#quantity").value;
        const prevButton = document.querySelector("#prevButtonStep2");

        if (quantity === "" || quantity === null) {
          alert("Musisz wybrać ilość worków");
          prevButton.click();
          return false;
        }
      }

      if(this.currentStep === 4){
        const prevButton = document.querySelector('#prevButtonStep3');
        if(institutionSelect() === null){
          alert("Musisz wybrać jedną instytucję");
          prevButton.click();
          return false;
        }
      }

      if(this.currentStep === 5){
        const prevButton = document.querySelector("#prevButtonStep4");
        const street = document.querySelector("#street").value;
        const city = document.querySelector("#city").value;
        const zipCode = document.querySelector("#zipCode").value;
        const date = document.querySelector("#pickUpDate").value;
        const time = document.querySelector("#pickUpTime").value;
        const comment = document.querySelector("#pickUpComment").value;

        if (street === null || street === "") {
          alert("Adres jest wymagany");
          prevButton.click();
          return false;
        }

        if (city === null || city === "") {
          alert("Miasto jest wymagane");
          prevButton.click();
          return false;
        }

        if (zipCode === null || zipCode === "") {
          alert("Kod pocztowy jest wymagany");
          prevButton.click();
          return false;
        }

        if (date === null || date === "") {
          alert("Data jest wymagana");
          prevButton.click();
          return false;
        }

        if (time === null || time === "") {
          alert("Godzina odbioru jest wymagana");
          prevButton.click();
          return false;
        }
      }

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary

      if(this.currentStep === 5){
        document.getElementById('displayQuantity').innerHTML =
            document.getElementById("quantity").value;
        document.getElementById('displayStreet').innerHTML =
            document.getElementById("street").value;
        document.getElementById('displayCity').innerHTML =
            document.getElementById("city").value;
        document.getElementById('displayZipCode').innerHTML =
            document.getElementById("zipCode").value;
        document.getElementById('displayPickUpDate').innerHTML =
            document.getElementById("pickUpDate").value;
        document.getElementById('displayPickUpTime').innerHTML =
            document.getElementById("pickUpTime").value;
        document.getElementById('displayPickUpComment').innerHTML =
            document.getElementById("pickUpComment").value;
      }
    }

  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }
});
