module IntegrationHelper

  #Functions to Accept or decline javascript dialogs for capybara-webkit driver. More info at https://github.com/thoughtbot/capybara-webkit/issues/84
  def handle_js_confirm(accept=true)
    page.evaluate_script "window.original_confirm_function = window.confirm"
    page.evaluate_script "window.confirm = function(msg) { return #{!!accept}; }"
    yield
    page.evaluate_script "window.confirm = window.original_confirm_function"
  end

  def page!
    save_and_open_page
  end

end