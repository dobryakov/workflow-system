require 'test_helper'

class WorkpointTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "workflow1" do

    # create workflow

    @wf = Workflow.create(
        :title => "Workflow 1"
    )

    # create workpoints

    @wp1 = Workpoint.create(:title => "Workpoint 1")
    @wp2 = Workpoint.create(:title => "Workpoint 2")
    @wp3 = Workpoint.create(:title => "Workpoint 3")

    @wf.workpoints << @wp1
    @wf.workpoints << @wp2
    @wf.workpoints << @wp3

    assert @wf.workpoints.count == 3

    # create outs

    @out1 = Out.create(:title => 'Fill 1st field', :workpoint => @wp1, :next_workpoint => @wp2)
    @out2 = Out.create(:title => 'Fill 2nd field', :workpoint => @wp2, :next_workpoint => @wp3)
    @out3 = Out.create(:title => 'Fill 3rd field', :workpoint => @wp3)

    @wp1.reload
    @wp2.reload
    @wp3.reload

    # create filter

    @f1 = StubFilter.create( :title => 'Stub filter title' )

    @out1.filters << @f1
    @out2.filters << @f1

    assert @f1.outs.count == 2

    # link outs to workpoints

    #@wolink1 = Wolink.create( :workpoint => @wp1, :out => @out1, :next_workpoint => @wp2 )
    #@wolink2 = Wolink.create( :workpoint => @wp2, :out => @out2, :next_workpoint => @wp3 )
    #@wolink3 = Wolink.create( :workpoint => @wp3, :out => @out3 )

    @wp1.reload
    @out1.reload

    assert @wp1.outs.count == 1
    assert @wp1.outs.first == @out1
    assert @out1.workpoint == @wp1

    # create users

    @u1 = User.create(:login => 'Login 1', :password => 'Password 1')
    @u2 = User.create(:login => 'Login 2', :password => 'Password 2')
    @u3 = User.create(:login => 'Login 3', :password => 'Password 3')

    # check user's auto-created start workpoint

    assert @u1.workpoints.count == 1

    # assign users to workpoints

    @wp1.users << @u1
    @wp2.users << @u2
    @wp3.users << @u3

    assert @wp1.users.count == 1

    # create message

    @m1 = Message.create(:content => 'Message 1')

    assert !@m1.accepted?
    assert !@m1.assigned?
    assert !@m1.completed?

    # assign message on the 1st workpoint

    Assignmessagefact.create(
        :message   => @m1,
        :user      => @wp1.users.sample,
        :workpoint => @wp1
    )

    assert @m1.assigned?
    assert !@m1.accepted?

    # accept message on the 1st workpoint

    @m2 = Acceptmessagefact.create(
        :message   => @m1,
        :user      => @wp1.users.sample,
        :workpoint => @wp1
    ).cloned_message

    assert @m1.accepted?
    assert !@m2.accepted?

    # message 1 nether been completed, because its born out of nothing

    assert !@m1.completed?

    # or, the same
    # (test for counter_cache rails feature)
    # http://guides.rubyonrails.org/association_basics.html

    @m1.reload
    assert @m1.is_accepted == 1
    assert @m2.is_accepted == 0

    # do the job and complete message on the 1st workpoint and 1st out,
    # and get next message 3

    Completemessagefact.create(
        :message => @m2,
        :out     => @wp1.outs.first
    ).message

    assert @m2.completed?
    assert @m2.completed?.message == @m2

    # check for next workpoint

    assert @m2.recipient_workpoint == @wp2

    # check for assigned on next workpoint

    assert @m2.assigned?

    # assign message on workpoint 2

    # пока не нужно, так как мессадж ассигнится сразу из комплита
    #Assignmessagefact.create(
    #    :message   => @m2,
    #    :user      => @wp2.users.sample,
    #    :workpoint => @wp2
    #)

    # accept message on workpoint 2

    @m3 = Acceptmessagefact.create(
        :message   => @m2,
        :user      => @wp2.users.first,
        :workpoint => @wp2
    ).cloned_message

    assert @m2.accepted?

    # check that "accept message fact" is created

    assert @m2.messagefacts.where(:type => Acceptmessagefact).first

    # or, the same:

    assert @m2.accepted?

    # test for counter_cache rails feature
    # http://guides.rubyonrails.org/association_basics.html

    @m2.reload
    assert @m2.is_completed == 1
    assert @m2.is_accepted  == 1

    # check that fact has user 2

    assert @m2.accepted?.user == @u2

    # check some params for message 3

    assert @m3.sender_workpoint == @wp2

    # complete message 3 on workpoint 2

    @m3 = Completemessagefact.create(
        :message => @m3,
        :out     => @wp2.outs.first
    ).message

    @m3.reload
    assert @m3.sender_workpoint    == @wp2
    assert @m3.recipient_workpoint == @wp3

    assert @m3.completed?
    assert !@m3.accepted?

    # сообщение ассигнуто получателем, так как это делается автоматически в комплите
    assert @m3.assigned?

    # попытка закомплитить мессадж, который не предназначен для этого

    @m4 = @wp3.complete_message(@m3, @wp3.outs.first)
    assert !@m4

    # на самом деле нужно заакцептить

    @m4 = @wp3.accept_message(@m3)

    # и только потом пытаться закомплитить

    @m5 = @wp3.complete_message(@m4, @wp3.outs.first)

    # а так как на нём нет аутов, то и закомплитить нельзя

    assert !@m5.completed?

  end

end
