<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="LNSQWebApp1.Customer1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
        <div class="col-md-6">
            <div class="form-group">
                <div class="control-label col-md-3">
                    First Name
                </div>
                <div class="col-md-9">
                    <asp:HiddenField ID="hdnCustomerID" runat="server" Value="0" />
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
            </div>
            <div class="form-group">
                <div class="control-label col-md-3">
                    Last Name
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
            </div>
            <div class="form-group">
                <div class="control-label col-md-3">
                    Birth Date
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtBirthDate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
            </div>
            <div class="form-group">
                <div class="control-label col-md-3">
                    Email
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
            </div>
            <div class="form-group">
                <div class="control-label col-md-3">
                    Address
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>                
            </div>
            <div class="form-group">
                <div class="col-md-9">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn pull-right btn-success" OnClick="btnSave_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger"/>
                </div>
            </div>
        </div>
        <div class="col-md-6">

        </div>
    </div>
    
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="CustomerID" HeaderStyle-CssClass="bg-primary" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
            <Columns>
                <asp:TemplateField HeaderText="First Name">
                    <AlternatingItemTemplate>
                        <asp:HiddenField ID="hdnCustomerID" runat="server" Value='<%#Bind("CustomerID") %>'/>
                        <asp:LinkButton ID="lnkFirstName" runat="server" Text='<%#Bind("FirstName") %>'></asp:LinkButton>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                         <asp:HiddenField ID="hdnCustomerID" runat="server" Value='<%#Bind("CustomerID") %>'/>
                        <asp:LinkButton ID="lnkFirstName" runat="server" Text='<%#Bind("FirstName") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%#Bind("LastName") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%#Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birth Date">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblBirthDate" runat="server" Text='<%#Bind("BirthDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBirthDate" runat="server" Text='<%#Bind("BirthDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%#Bind("Email") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%#Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit | Delete">
                    <AlternatingItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex %>' CommandName="EDT" ></asp:LinkButton> |
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DLT"></asp:LinkButton>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                         <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex %>' CommandName="EDT" ></asp:LinkButton> |
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DLT"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
    <script type="text/html">
        $(document).ready(function(){
            
        });
    </script>
</asp:Content>
