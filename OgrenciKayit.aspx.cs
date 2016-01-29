using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.IO;    
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using DevExpress.Web;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using DevExpress.XtraScheduler;
using DevExpress.XtraScheduler.Native;
public partial class OgrenciKayit : System.Web.UI.Page
{
     Fonksiyonlar vt = new Fonksiyonlar();
     protected void Page_Load(object sender, EventArgs e)
     { 
         
     }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        {
            SqlConnection baglan = vt.baglan();
            SqlCommand komut;
            string sorgu = ("SELECT COUNT(*) FROM ogrenci  where ogr_no = '" + TextBox1.Text + "' and ders_id ='" + CheckBoxList1.SelectedItem.Text + "' ");
            komut = new SqlCommand(sorgu, baglan);
            int kayitsayisi = (int)komut.ExecuteScalar();
            while (kayitsayisi <= 1)
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        SqlCommand cmd = new SqlCommand("insert into ogrenci (ogr_no, ogr_adi,ogr_soyadi,bolum_id,ders_id,ders_adi,bolum_adi) Values(@ogr_no,@ogr_adi,@ogr_soyadi,@bolum_id,@ders_id,@ders_adi,@bolum_adi)", baglan);
                        cmd.Parameters.Add("ogr_no", TextBox1.Text);
                        cmd.Parameters.Add("ogr_adi", TextBox2.Text);
                        cmd.Parameters.Add("ogr_soyadi", TextBox3.Text);
                        cmd.Parameters.Add("bolum_id", DropDownList1.SelectedValue);
                        cmd.Parameters.Add("bolum_adi", DropDownList1.SelectedItem.Text);


                        cmd.Parameters.AddWithValue("ders_id", CheckBoxList1.Items[i].Value);
                        cmd.Parameters.AddWithValue("ders_adi", CheckBoxList1.Items[i].Text);



                        cmd.ExecuteNonQuery();

                    }

                }

                baglan.Close();
                Response.Redirect("Ogrencikayit.aspx");
            }

        }
    }
    
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
    {
       CheckBoxList2.Items[0].Attributes.Add("style", "background-color: red;");
    }

   
    protected void ASPxScheduler1_BeforeExecuteCallbackCommand(object sender, SchedulerCallbackCommandEventArgs e) {
        if(e.CommandId == "MNUVIEW")
            e.Command = new CustomMenuViewCallbackCommand(ASPxScheduler1);
        else if(e.CommandId == "USRAPTMENU")
            e.Command = new CustomMenuAppointmentCallbackCommand(ASPxScheduler1);
    }
    protected void ASPxScheduler1_PopupMenuShowing(object sender, DevExpress.Web.ASPxScheduler.PopupMenuShowingEventArgs e) {
        ASPxSchedulerPopupMenu menu = e.Menu;
        DevExpress.Web.MenuItemCollection menuItems = menu.Items;
        if(menu.Id.Equals(SchedulerMenuItemId.DefaultMenu)) {
            ClearUnusedDefaultMenuItems(menu);
            AddScheduleNewEventSubMenu(menu, "Schedule New Event");
        } else if(menu.Id.Equals(SchedulerMenuItemId.AppointmentMenu)) {
            menu.ClientSideEvents.ItemClick = String.Format("function(s, e) {{ DefaultAppointmentMenuHandler({0}, s, e); }}", ASPxScheduler1.ClientID);
            menu.Items.Clear();
            AddScheduleNewEventSubMenu(menu, "Change Event");
            DevExpress.Web.MenuItem deleteItem = new DevExpress.Web.MenuItem("Delete", "DeleteId");
            deleteItem.BeginGroup = true;
            menuItems.Add(deleteItem);
        }
    }
    protected void AddScheduleNewEventSubMenu(ASPxSchedulerPopupMenu menu, string caption) {
        DevExpress.Web.MenuItem newWithTemplateItem = new DevExpress.Web.MenuItem(caption, "TemplateEvents");
        newWithTemplateItem.BeginGroup = true;
        menu.Items.Insert(0, newWithTemplateItem);
        AddTemplatesSubMenuItems(newWithTemplateItem);
    }
    private static void AddTemplatesSubMenuItems(DevExpress.Web.MenuItem parentMenuItem) {
        parentMenuItem.Items.Add(new DevExpress.Web.MenuItem("Check engine oil", "CheckEngineOilId"));
        parentMenuItem.Items.Add(new DevExpress.Web.MenuItem("Wash the car", "WashCarId"));
        parentMenuItem.Items.Add(new DevExpress.Web.MenuItem("Wax the car", "WaxCarId"));
        parentMenuItem.Items.Add(new DevExpress.Web.MenuItem("Check transmission fluid", "CheckTransmissionFluidId"));
        parentMenuItem.Items.Add(new DevExpress.Web.MenuItem("Inspect by mechanic", "InspectByMechanicId"));
    }
    protected void ClearUnusedDefaultMenuItems(ASPxSchedulerPopupMenu menu) {
        
        RemoveMenuItem(menu, "NewAllDayEvent");
        RemoveMenuItem(menu, "NewRecurringAppointment");
        RemoveMenuItem(menu, "NewRecurringEvent");
        RemoveMenuItem(menu, "GotoToday");
        RemoveMenuItem(menu, "GotoDate");
    }
    protected void RemoveMenuItem(ASPxSchedulerPopupMenu menu, string menuItemName) {
        DevExpress.Web.MenuItem item = menu.Items.FindByName(menuItemName);
        if(item != null)
            menu.Items.Remove(item);
    }
}

#region CustomMenuViewCallbackCommand
public class CustomMenuViewCallbackCommand : MenuViewCallbackCommand {
    string myMenuItemId;

    public CustomMenuViewCallbackCommand(ASPxScheduler control)
        : base(control) {
    }

    public string MyMenuItemId { get { return myMenuItemId; } }

    protected override void ParseParameters(string parameters) {
        this.myMenuItemId = parameters;
        base.ParseParameters(parameters);
    }
    protected override void ExecuteCore() {
        ExecuteUserMenuCommand(MyMenuItemId);
        base.ExecuteCore();
    }
    protected internal virtual void ExecuteUserMenuCommand(string menuItemId) {
        if(menuItemId == "CheckEngineOilId")
            CreateAppointment("Check engine oil", AppointmentStatusType.Busy, 4);
        else if(menuItemId == "WashCarId")
            CreateAppointment("Wash the car", AppointmentStatusType.OutOfOffice, 1);
        else if(menuItemId == "WaxCarId")
            CreateAppointment("Wax the car", AppointmentStatusType.Tentative, 1);
        else if(menuItemId == "CheckTransmissionFluidId")
            CreateAppointment("Check transmission fluid", AppointmentStatusType.Busy, 6);
        else if(menuItemId == "InspectByMechanicId")
            CreateAppointment("Inspect by mechanic", AppointmentStatusType.Busy, 7);
    }
    protected void CreateAppointment(string subject, AppointmentStatusType statusType, int labelId) {
        Appointment apt = Control.Storage.CreateAppointment(AppointmentType.Normal);
        apt.Subject = subject;
        apt.Start = Control.SelectedInterval.Start;
        apt.End = Control.SelectedInterval.End;
        apt.ResourceId = Control.SelectedResource.Id;
        apt.StatusId = (int)statusType;
        apt.LabelId = labelId;
        Control.Storage.Appointments.Add(apt);
    }
}
#endregion

#region CustomMenuAppointmentCallbackCommand
public class CustomMenuAppointmentCallbackCommand : SchedulerCallbackCommand {
    string menuItemId = String.Empty;

    public CustomMenuAppointmentCallbackCommand(ASPxScheduler control)
        : base(control) {
    }

    public override string Id { get { return "USRAPTMENU"; } }
    public string MenuItemId { get { return menuItemId; } }

    protected override void ParseParameters(string parameters) {
        this.menuItemId = parameters;
    }
    protected override void ExecuteCore() {
        Appointment apt = Control.SelectedAppointments[0];
        if(MenuItemId == "DeleteId")
            apt.Delete();
        else if(MenuItemId == "CheckEngineOilId")
            UpdateAppointment(apt, "Check engine oil", AppointmentStatusType.Busy, 4);
        else if(MenuItemId == "WashCarId")
            UpdateAppointment(apt, "Wash the car", AppointmentStatusType.OutOfOffice, 1);
        else if(MenuItemId == "WaxCarId")
            UpdateAppointment(apt, "Wax the car", AppointmentStatusType.Tentative, 1);
        else if(MenuItemId == "CheckTransmissionFluidId")
            UpdateAppointment(apt, "Check transmission fluid", AppointmentStatusType.Busy, 6);
        else if(MenuItemId == "InspectByMechanicId")
            UpdateAppointment(apt, "Inspect by mechanic", AppointmentStatusType.Busy, 7);
    }
    protected void UpdateAppointment(Appointment apt, string subject, AppointmentStatusType statusType, int labelId) {
        apt.Subject = subject;
        apt.StatusId = (int)statusType;
        apt.LabelId = labelId;
    }
}



#endregion