class ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
    @user = current_user
  end

  def new
    @user = current_user
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @user = current_user
    @report = current_user.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @user, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
      else
        format.html { redirect_to @user, notice: t('errors.template.header.one', name: Report.model_name.human) }
      end
    end
  end

  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
      else
        format.html { redirect_to @user, notice: t('errors.template.header.one', name: Report.model_name.human) }
      end
    end
  end

  def destroy
    @user = current_user
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.destroy
        format.html { redirect_to @user, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
      else
        format.html { redirect_to @user, notice: t('errors.template.header.one', name: Report.model_name.human) }
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
