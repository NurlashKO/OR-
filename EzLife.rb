#From NurlashKO with Love<3
require 'rubygems'
require 'mechanize'
require 'io/console'
intranet = Mechanize.new
puts("----------------------LOG IN INTRANET------------------------")
intranet.get('http://intranet2.kbtu.kz/registraroffice/default.aspx') do |page|

    form = page.form_with(:action => "login.aspx?path=http://intranet2.kbtu.kz/registraroffice/default.aspx")
    button = form.button_with(:value => "Login")
    login_page = intranet.submit(form, button)

    main = login_page.form_with(:action => 'login.aspx?path=http://intranet2.kbtu.kz/registraroffice/default.aspx') do |f|
         
        print "ENTER YOUR ID(z_aman) : "
        f.uname = gets.chomp
        print "ENTER YOUR PASSWORD(NURLASHKOialreadychangedit) : "
        f.pwd = STDIN.noecho(&:gets).chomp

        print "\n"
    end.click_button
end

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

puts("-------------------LOG IN REGISTRATION OFFICE----------------------------");

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
        password_field.value = STDIN.noecho(&:gets).chomp
        print "\n"
    end.click_button


    puts("-------------------FILL OUT FORMS------------------------------------")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl1_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl2_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl3_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl4_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl5_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl6_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl7_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl8_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl9_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl10_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl11_HLink")
    fillForm(intranet, main, "_ctl0__ctl0_Questionnaires1_rptQuestionnaire__ctl12_HLink")

end
