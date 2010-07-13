USE [EL]
GO
/****** Object:  Table [dbo].[DepartmentCode]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentCode](
	[HOME_DEPT_NO] [nvarchar](6) NOT NULL,
	[COLLEGE] [nvarchar](25) NULL,
	[HOMEDEPT_NAME] [nvarchar](30) NULL,
	[HOMEDEPT_LOC] [nvarchar](2) NULL,
	[INACTIVE] [bit] NOT NULL,
	[VISIBLE] [bit] NOT NULL,
	[EffectiveDeptNo] [nvarchar](6) NOT NULL,
	[AbbreviatedName] [nvarchar](10) NULL,
 CONSTRAINT [PK_DepartmentCode] PRIMARY KEY CLUSTERED 
(
	[HOME_DEPT_NO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DADAssociateDeans]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DADAssociateDeans](
	[DADAssociateDeanID] [int] NOT NULL,
	[DADAssociateDeanName] [nvarchar](50) NOT NULL,
	[DADKerb] [varchar](50) NULL,
 CONSTRAINT [PK_DADAssociateDeans] PRIMARY KEY CLUSTERED 
(
	[DADAssociateDeanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Committee]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Committee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Inactive] [bit] NOT NULL,
 CONSTRAINT [PK_Committee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Analysts]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Analysts](
	[AnalystID] [int] NOT NULL,
	[AnalystName] [nvarchar](50) NOT NULL,
	[AnalystKerb] [varchar](50) NULL,
 CONSTRAINT [PK_Analysts] PRIMARY KEY CLUSTERED 
(
	[AnalystID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActionTypes]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Inactive] [bit] NOT NULL,
 CONSTRAINT [PK_ActionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleCode]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleCode](
	[TCI_TITLE_CODE] [nvarchar](4) NOT NULL,
	[TCI_TITLE_NAME] [nvarchar](150) NOT NULL,
	[TCI_TITLE_NM_ABBRV] [nvarchar](50) NOT NULL,
	[Visible] [bit] NOT NULL,
	[Common] [bit] NOT NULL,
	[BlankTitle] [bit] NOT NULL,
 CONSTRAINT [PK_TitleCode] PRIMARY KEY CLUSTERED 
(
	[TCI_TITLE_CODE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Step]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](11) NULL,
	[Inactive] [bit] NOT NULL,
 CONSTRAINT [PK_Step] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[EMPLOYEE_ID] [nvarchar](9) NOT NULL,
	[EMP_NAME] [nvarchar](50) NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[EMPLOYEE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EligibilityList]    Script Date: 04/15/2010 14:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EligibilityList](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](9) NOT NULL,
	[DIST_DEPT_CODE] [nvarchar](6) NULL,
	[FISCode] [char](4) NOT NULL,
	[DADAssociateDeanID] [int] NULL,
	[DADKerb] [varchar](50) NULL,
	[AnalystID] [int] NULL,
	[AnalystKerb] [varchar](50) NULL,
	[ActionID] [int] NOT NULL,
	[YearsAtRank] [int] NOT NULL,
	[YearsAtStep] [int] NOT NULL,
	[AppointmentPercent] [decimal](18, 0) NOT NULL,
	[CommitteeID] [int] NOT NULL,
	[TITLE_CODE] [nvarchar](4) NOT NULL,
	[CurrentStep] [int] NOT NULL,
	[CurrentBlankTitle] [nvarchar](50) NULL,
	[ProposedTitleCode] [nvarchar](4) NULL,
	[ProposedStep] [int] NULL,
	[ProposedBlankTitle] [nvarchar](50) NULL,
	[YearsAccelerated] [int] NULL,
	[YearsDecelerated] [int] NULL,
	[Defer] [bit] NULL,
	[DateDue] [datetime] NULL,
	[DateToCommittee] [datetime] NULL,
	[DateCommitteeReceived] [datetime] NULL,
	[DateEffective] [datetime] NULL,
	[Comment] [nvarchar](2048) NULL,
	[FinalAction] [bit] NULL,
	[TPC_PAY_REP_CODE] [nvarchar](4) NULL,
	[APPT_NUM] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[ProposedAppointmentPercent] [decimal](18, 0) NOT NULL,
	[Inactive] [bit] NULL,
	[OriginalApptID] [int] NULL,
	[EditorKerb] [varchar](50) NULL,
 CONSTRAINT [PK_EligibilityList] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePerson]    Script Date: 04/15/2010 14:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Scott Kirkland
-- Create date: 3/9/2010
-- Description:	Merge Updates from PPSDataMart to local Person table
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdatePerson] 

AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	merge EL.dbo.Person
	using
	(
		SELECT EmployeeID, FullName, FirstName, LastName
		FROM PPSDataMart.dbo.Persons persons
	) PPS on Person.EMPLOYEE_ID = PPS.EmployeeID

	WHEN MATCHED THEN UPDATE set
		EMPLOYEE_ID = PPS.EmployeeID,
		EMP_NAME = PPS.FullName,
		FirstName = PPS.FirstName,
		LastName = PPS.LastName
      
    WHEN NOT MATCHED BY TARGET THEN INSERT VALUES 
      (
		EmployeeID, FullName, FirstName, LastName
      );
END
GO
/****** Object:  View [dbo].[vPersons]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPersons]
AS
SELECT     EmployeeID, FirstName, MiddleName, LastName, FullName, Suffix, BirthDate, UCDMailID, UCDLoginID, HomeDepartment, AlternateDepartment, 
                      AdministrativeDepartment, SchoolDivision, PrimaryTitle, PrimaryApptNo, PrimaryDistNo, JobGroupID, HireDate, OriginalHireDate, EmployeeStatus, StudentStatus, 
                      EducationLevel, BarganingUnit, LeaveServiceCredit, Supervisor, LastChangeDate
FROM         PPSDataMart.dbo.Persons
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Persons (PPSDataMart.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 348
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersons'
GO
/****** Object:  View [dbo].[vPayrollPersons]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPayrollPersons]
AS
SELECT DISTINCT 
                      appt.EmployeeID + '|' + ISNULL(appt.Department, persons.HomeDepartment) + '|' + appt.TitleCode AS ID, appt.EmployeeID, ISNULL(appt.Department, 
                      persons.HomeDepartment) AS Department, appt.TitleCode, persons.FullName
FROM         PPSDataMart.dbo.Appointments AS appt INNER JOIN
                      PPSDataMart.dbo.Persons AS persons ON persons.EmployeeID = appt.EmployeeID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "appt"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "persons"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 125
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPayrollPersons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPayrollPersons'
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsers]
AS
SELECT     UserID, LoginID, Email, Phone, FirstName, LastName, EmployeeID, UserKey, SID
FROM         Catbert3.dbo.Users
WHERE     (Inactive = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users (Catbert3.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'able = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
/****** Object:  View [dbo].[vUnits]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUnits]
AS
SELECT     UnitID AS id, FullName, ShortName, PPS_Code, FIS_Code, SchoolCode
FROM         Catbert3.dbo.Unit
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Unit (Catbert3.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 249
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUnits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUnits'
GO
/****** Object:  View [dbo].[vUnitAssociations]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUnitAssociations]
AS
SELECT     UnitAssociationID, UnitID, UserID, ApplicationID, Inactive
FROM         Catbert3.dbo.UnitAssociations
WHERE     (ApplicationID IN
                          (SELECT     ApplicationID
                            FROM          Catbert3.dbo.Applications
                            WHERE      (Name = 'EligibilityList'))) AND (Inactive = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UnitAssociations (Catbert3.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 182
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUnitAssociations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUnitAssociations'
GO
/****** Object:  View [dbo].[v_TempEligibility]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TempEligibility]
AS
SELECT     dbo.Person.EMP_NAME, dbo.ActionType.ActionType, dbo.tempEligibilityList.YearsAtRank, dbo.tempEligibilityList.YearsAtStep, 
                      dbo.tempEligibilityList.YearsAccelerated, dbo.tempEligibilityList.YearsDecelerated, dbo.tempEligibilityList.CurrentBlankTitle, 
                      dbo.TitleCode.TCI_TITLE_NM_ABBRV AS CurrentStatus, dbo.tempEligibilityList.AppointmentPercent, dbo.tempEligibilityList.ProposedBlankTitle, 
                      TitleCode_1.TCI_TITLE_NM_ABBRV AS Proposed, dbo.Committee.Committee, dbo.tempEligibilityList.DateDue, 
                      dbo.tempEligibilityList.DIST_DEPT_CODE, dbo.tempEligibilityList.AppointmentID, dbo.tempEligibilityList.EmployeeID, dbo.tempEligibilityList.Comment, 
                      dbo.Step.Step AS CurStep, Step_1.Step AS ProStep, dbo.tempEligibilityList.ProposedAppointmentPercent, dbo.tempEligibilityList.Defer
FROM         dbo.tempEligibilityList INNER JOIN
                      dbo.Person ON dbo.tempEligibilityList.EmployeeID = dbo.Person.EMPLOYEE_ID INNER JOIN
                      dbo.ActionType ON dbo.tempEligibilityList.ActionID = dbo.ActionType.ActionID INNER JOIN
                      dbo.Committee ON dbo.tempEligibilityList.CommitteeID = dbo.Committee.CommitteeID INNER JOIN
                      dbo.Step ON dbo.tempEligibilityList.CurrentStep = dbo.Step.StepID INNER JOIN
                      dbo.Step Step_1 ON dbo.tempEligibilityList.ProposedStep = Step_1.StepID LEFT OUTER JOIN
                      dbo.TitleCode ON dbo.tempEligibilityList.TITLE_CODE = dbo.TitleCode.TCI_TITLE_CODE LEFT OUTER JOIN
                      dbo.TitleCode TitleCode_1 ON dbo.tempEligibilityList.ProposedTitleCode = TitleCode_1.TCI_TITLE_CODE
GO
/****** Object:  View [dbo].[v_EligibleCandidates]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_EligibleCandidates]
AS
SELECT DISTINCT dbo.EligibilityList.DIST_DEPT_CODE, dbo.Person.EMP_NAME, dbo.Person.EMPLOYEE_ID
FROM         dbo.EligibilityList INNER JOIN
                      dbo.Person ON dbo.EligibilityList.EmployeeID = dbo.Person.EMPLOYEE_ID
GO
/****** Object:  View [dbo].[v_DepartmentsInUse]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_DepartmentsInUse]
AS
SELECT DISTINCT dbo.EligibilityList.DIST_DEPT_CODE, dbo.DepartmentCode.HOMEDEPT_NAME, dbo.DepartmentCode.EffectiveDeptNo
FROM         dbo.EligibilityList INNER JOIN
                      dbo.DepartmentCode ON dbo.EligibilityList.DIST_DEPT_CODE = dbo.DepartmentCode.HOME_DEPT_NO
GO
/****** Object:  View [dbo].[v_CandidateSummary]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CandidateSummary]
AS
SELECT	dbo.Person.EMP_NAME, dbo.ActionType.ActionType, dbo.EligibilityList.YearsAtRank, dbo.EligibilityList.YearsAtStep,
		dbo.EligibilityList.YearsAccelerated, dbo.EligibilityList.YearsDecelerated, dbo.EligibilityList.CurrentBlankTitle,
		dbo.TitleCode.TCI_TITLE_NM_ABBRV AS CurrentStatus, dbo.EligibilityList.AppointmentPercent, dbo.EligibilityList.ProposedBlankTitle,
		TitleCode_1.TCI_TITLE_NM_ABBRV AS Proposed, dbo.Committee.Committee, dbo.EligibilityList.DateDue, dbo.EligibilityList.LastUpdated,
		dbo.EligibilityList.DIST_DEPT_CODE, dbo.EligibilityList.AppointmentID, dbo.EligibilityList.EmployeeID, dbo.EligibilityList.Comment,
		dbo.Step.Step AS CurStep, Step_1.Step AS ProStep, dbo.EligibilityList.ProposedAppointmentPercent, dbo.EligibilityList.Defer,
		dbo.DepartmentCode.HOMEDEPT_NAME, dbo.DepartmentCode.AbbreviatedName

FROM 		dbo.EligibilityList INNER JOIN
		dbo.Person ON dbo.EligibilityList.EmployeeID = dbo.Person.EMPLOYEE_ID INNER JOIN
		dbo.ActionType ON dbo.EligibilityList.ActionID = dbo.ActionType.ActionID INNER JOIN
		dbo.TitleCode ON dbo.EligibilityList.TITLE_CODE = dbo.TitleCode.TCI_TITLE_CODE INNER JOIN
		dbo.Committee ON dbo.EligibilityList.CommitteeID = dbo.Committee.CommitteeID INNER JOIN
		dbo.TitleCode TitleCode_1 ON dbo.EligibilityList.ProposedTitleCode = TitleCode_1.TCI_TITLE_CODE INNER JOIN
		dbo.Step ON dbo.EligibilityList.CurrentStep = dbo.Step.StepID INNER JOIN
		dbo.Step Step_1 ON dbo.EligibilityList.ProposedStep = Step_1.StepID INNER JOIN
		dbo.DepartmentCode ON dbo.EligibilityList.DIST_DEPT_CODE = dbo.DepartmentCode.HOME_DEPT_NO
GO
/****** Object:  View [dbo].[vTitles]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTitles]
AS
SELECT     TitleCode, Name, AbbreviatedName, PersonnelProgramCode, UnitCode, TitleGroup, OvertimeExemptionCode, EffectiveDate, UpdateTimestamp
FROM         PPSDataMart.dbo.Titles
WHERE     (TitleCode IN
                          (SELECT     TCI_TITLE_CODE
                            FROM          dbo.TitleCode
                            WHERE      (Visible = 1)))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Titles (PPSDataMart.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vTitles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vTitles'
GO
/****** Object:  View [dbo].[vEligibilityListQuery]    Script Date: 04/15/2010 14:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEligibilityListQuery]
AS
SELECT     dbo.EligibilityList.AppointmentID, dbo.Person.EMP_NAME AS Name, dbo.ActionTypes.Name AS ActionType, dbo.EligibilityList.YearsAtRank, 
                      dbo.EligibilityList.YearsAtStep, dbo.EligibilityList.YearsAccelerated, dbo.EligibilityList.YearsDecelerated, dbo.Committee.Name AS Committee, 
                      dbo.EligibilityList.DateDue, dbo.EligibilityList.Defer, dbo.EligibilityList.AppointmentPercent AS CurrentAppointmentPercent, 
                      CurrentTitles.AbbreviatedName AS CurrentTitle, CurrentSteps.Name AS CurrentStep, 
                      CurrentTitles.AbbreviatedName + ' Step: ' + CurrentSteps.Name + ' ' + CAST(dbo.EligibilityList.AppointmentPercent AS varchar(16)) + '%' AS CurrentStatus, 
                      dbo.EligibilityList.ProposedAppointmentPercent, ProposedTitles.AbbreviatedName AS ProposedTitle, ProposedSteps.Name AS ProposedStep, 
                      ProposedTitles.AbbreviatedName + ' Step: ' + ProposedSteps.Name + ' ' + CAST(dbo.EligibilityList.ProposedAppointmentPercent AS varchar(16)) 
                      + '%' AS ProposedStatus, (CASE WHEN dbo.EligibilityList.OriginalApptID IS NOT NULL THEN 1 ELSE 0 END) AS HasOriginalEligibility, dbo.EligibilityList.FISCode, 
                      dbo.EligibilityList.Comment
FROM         dbo.EligibilityList INNER JOIN
                      dbo.Person ON dbo.EligibilityList.EmployeeID = dbo.Person.EMPLOYEE_ID INNER JOIN
                      dbo.ActionTypes ON dbo.EligibilityList.ActionID = dbo.ActionTypes.ID INNER JOIN
                      dbo.Committee ON dbo.EligibilityList.CommitteeID = dbo.Committee.ID LEFT OUTER JOIN
                      dbo.vTitles AS CurrentTitles ON dbo.EligibilityList.TITLE_CODE = CurrentTitles.TitleCode LEFT OUTER JOIN
                      dbo.Step AS CurrentSteps ON dbo.EligibilityList.CurrentStep = CurrentSteps.ID LEFT OUTER JOIN
                      dbo.vTitles AS ProposedTitles ON dbo.EligibilityList.ProposedTitleCode = ProposedTitles.TitleCode LEFT OUTER JOIN
                      dbo.Step AS ProposedSteps ON dbo.EligibilityList.ProposedStep = ProposedSteps.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EligibilityList"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 291
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 6
               Left = 308
               Bottom = 250
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ActionTypes"
            Begin Extent = 
               Top = 6
               Left = 506
               Bottom = 110
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Committee"
            Begin Extent = 
               Top = 6
               Left = 704
               Bottom = 110
               Right = 864
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CurrentTitles"
            Begin Extent = 
               Top = 114
               Left = 506
               Bottom = 233
               Right = 714
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CurrentSteps"
            Begin Extent = 
               Top = 234
               Left = 506
               Bottom = 338
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProposedTitles"
            Begin Extent = 
               Top = 294
               Left = 38
               Bottom = 413
               Right = 246
            End
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEligibilityListQuery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'          DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProposedSteps"
            Begin Extent = 
               Top = 234
               Left = 704
               Bottom = 338
               Right = 864
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEligibilityListQuery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEligibilityListQuery'
GO
/****** Object:  ForeignKey [FK_EligibilityList_ActionType]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_ActionType] FOREIGN KEY([ActionID])
REFERENCES [dbo].[ActionTypes] ([ID])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_ActionType]
GO
/****** Object:  ForeignKey [FK_EligibilityList_Analysts]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_Analysts] FOREIGN KEY([AnalystID])
REFERENCES [dbo].[Analysts] ([AnalystID])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_Analysts]
GO
/****** Object:  ForeignKey [FK_EligibilityList_Committee]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_Committee] FOREIGN KEY([CommitteeID])
REFERENCES [dbo].[Committee] ([ID])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_Committee]
GO
/****** Object:  ForeignKey [FK_EligibilityList_DADAssociateDeans]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_DADAssociateDeans] FOREIGN KEY([DADAssociateDeanID])
REFERENCES [dbo].[DADAssociateDeans] ([DADAssociateDeanID])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_DADAssociateDeans]
GO
/****** Object:  ForeignKey [FK_EligibilityList_DepartmentCode]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_DepartmentCode] FOREIGN KEY([DIST_DEPT_CODE])
REFERENCES [dbo].[DepartmentCode] ([HOME_DEPT_NO])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_DepartmentCode]
GO
/****** Object:  ForeignKey [FK_EligibilityList_Person]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_Person] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Person] ([EMPLOYEE_ID])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_Person]
GO
/****** Object:  ForeignKey [FK_EligibilityList_ProposedTitleCode]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_ProposedTitleCode] FOREIGN KEY([ProposedTitleCode])
REFERENCES [dbo].[TitleCode] ([TCI_TITLE_CODE])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_ProposedTitleCode]
GO
/****** Object:  ForeignKey [FK_EligibilityList_Step]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_Step] FOREIGN KEY([CurrentStep])
REFERENCES [dbo].[Step] ([ID])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_Step]
GO
/****** Object:  ForeignKey [FK_EligibilityList_Step1]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH CHECK ADD  CONSTRAINT [FK_EligibilityList_Step1] FOREIGN KEY([ProposedStep])
REFERENCES [dbo].[Step] ([ID])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_Step1]
GO
/****** Object:  ForeignKey [FK_EligibilityList_TitleCode]    Script Date: 04/15/2010 14:06:28 ******/
ALTER TABLE [dbo].[EligibilityList]  WITH NOCHECK ADD  CONSTRAINT [FK_EligibilityList_TitleCode] FOREIGN KEY([TITLE_CODE])
REFERENCES [dbo].[TitleCode] ([TCI_TITLE_CODE])
GO
ALTER TABLE [dbo].[EligibilityList] CHECK CONSTRAINT [FK_EligibilityList_TitleCode]
GO
