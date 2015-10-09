require 'rubygems'
require 'mechanize'

intranet = Mechanize.new

puts("----------------------LOG IN INTRANET------------------------")
intranet.get('http://intranet2.kbtu.kz/registraroffice/default.aspx') do |page|

    form = page.form_with(:action => "login.aspx?path=http://intranet2.kbtu.kz/registraroffice/default.aspx")
    button = form.button_with(:value => "Login")
    login_page = intranet.submit(form, button)

    main = login_page.form_with(:action => 'login.aspx?path=http://intranet2.kbtu.kz/registraroffice/default.aspx') do |f|
        f.uname  = 'School 20'
        f.pwd = 'Kbtu2015'
    end.click_button
end



puts("-------------------LOG IN REGISTRATION OFFICE----------------------------");

def fillForm(intranet, main, url)

    begin

        grades = main.link_with(:dom_id => url).click
        form = grades.form_with(:name => "__aspnetForm")

        form.radiobuttons_with().each do |field|
            field.check
        end

        button = form.button_with(:name => "_ctl0:_ctl0:btnSave")
        fill = intranet.submit(form, button)

        fill.form_with(:name => "__aspnetForm") do |f|
        end.click_button

    rescue

    end

end

intranet.get('http://intranet2.kbtu.kz/OR2/default.aspx') do |page|

    form = page.form_with(:name => "__aspnetForm")
    button = form.button_with(:name => '_ctl0:_ctl0:btnLogin')
    login_page = intranet.submit(form, button)

    main = login_page.form_with(:name => "__aspnetForm") do |f|
        username_field = f.field_with(:id => '_ctl0__ctl0_txtUserName')
        print "ENTER YOUR ID(14BD02074) : "
        username_field.value = gets.chomp
        password_field = f.field_with(:id => '_ctl0__ctl0_txtPassword')
        print "ENTER YOUR PASSWORD(NURLASHKOialreadychangedit) : "
        password_field.value = gets.chomp
    end.click_button


    puts("-------------------FILL OUT THE FORMS------------------------------------")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl1_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl2_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl3_HLink")
end
