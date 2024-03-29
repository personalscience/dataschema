USE [mytab2010]
GO
/****** Object:  Table [dbo].[AutoImmuneFilter]    Script Date: 6/5/2018 8:56:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Icd10Hierarchy](
	[ParentIcd10] [int] NULL,
	[Icd10] [varchar](10) NOT NULL,
	[Description] varchar(Max) NOT NULL,
	[Url] [varchar](255) NULL,
 CONSTRAINT [PK_Icd10Hierarchy] PRIMARY KEY CLUSTERED 
(
	[Icd10] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Citations]    Script Date: 6/5/2018 8:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SampleIcd10](
	[SampleId] [int] NOT NULL,
	[Icd10] [varchar](10) NOT NULL
 CONSTRAINT [PK_SampleIcd10] PRIMARY KEY CLUSTERED 
(
	[SampleId] ASC, [Icd10] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ConditionHierarchy](
	[ParentCondition] [int] NULL,
	[Condition] [varchar](10) NOT NULL,
	[Description] varchar(Max) NOT NULL,
	[Url] [varchar](255) NULL,
 CONSTRAINT [PK_ConditionHierarchy] PRIMARY KEY CLUSTERED 
(
	[Condition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Citations]    Script Date: 6/5/2018 8:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SampleCondition](
	[SampleId] [int] NOT NULL,
	[Condition] [varchar](10) NOT NULL,
	[Value] int NOT NULL
 CONSTRAINT [PK_SampleCondition] PRIMARY KEY CLUSTERED 
(
	[SampleId] ASC, [Condition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO
SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[ConditionDirection]    Script Date: 6/5/2018 8:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LabMeasure](
	[LabId] [int] IDENTITY(1,1) NOT NULL,
	[LabName] [varchar](255) NOT NULL,
	[Description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_LabMeasure] PRIMARY KEY CLUSTERED 
(
	[LabId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LabMeasureAlternativeName](
	[LabId] [int] NOT NULL,
	[AlternativeLabName] [varchar](255) NOT NULL,
	[Description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_LabMeasureAlternativeName] PRIMARY KEY CLUSTERED 
(
	[AlternativeLabName] ASC,
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[SampleLabMeasure](
	[SampleId] [int] NOT NULL,
	[LabId] [int] NOT NULL,
	[Value] float NOT NULL,
	[RefRangeLow] float NOT NULL,
	[RefRangeHigh] float NOT NULL
 CONSTRAINT [PK_SampleLabMeasure] PRIMARY KEY CLUSTERED 
(
	[SampleId] ASC, [LabId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Metabolism](
	[MetabolismId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
		[RefRangeLow] float NOT NULL,
	[RefRangeHigh] float NOT NULL,
 CONSTRAINT [PK_Metabolism] PRIMARY KEY CLUSTERED 
(
	[MetabolismId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CommonDrugName](
	[CommonDrugNameId] [int] IDENTITY(1,1) NOT NULL,
	[CommonName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CommonDrugName] PRIMARY KEY CLUSTERED 
(
	[CommonDrugNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[AlternativeCommonDrugName](
	[CommonDrugNameId] [int] IDENTITY(1,1) NOT NULL,
	[[AlternativeCommonName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AlternativeCommonDrugName] PRIMARY KEY CLUSTERED 
(
	[CommonDrugNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Table [dbo].[Symptoms]    Script Date: 6/5/2018 8:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Symptoms](
	[SymptomId] [int] IDENTITY(1,1) NOT NULL,
	[SymptomName] [varchar](255) NOT NULL,
	[SymptomUri] [varchar](255) NULL,
 CONSTRAINT [PK_Symptoms] PRIMARY KEY CLUSTERED 
(
	[SymptomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SymptomsHierarchy](
	[ParentSymptomId] [int]  NOT NULL,
	[SymptomId] [int]  NOT NULL,
 CONSTRAINT [PK_SymptomsHierarchy] PRIMARY KEY CLUSTERED 
(
	[ParentSymptomId] ASC,[SymptomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



/****** Object:  Table [dbo].[ubiomeTax]    Script Date: 6/5/2018 8:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Taxonomy](
	[taxon] [int] NOT NULL,
	[parenttaxon] [int] NOT NULL,
	[tax_name] [varchar](100) NOT NULL,
	[tax_rank] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Taxonomy] PRIMARY KEY CLUSTERED 
(
	[taxon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TaxonomyAlternative](
	[taxon] [int] NOT NULL,
	[tax_alternative_name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TaxonomyAlternative] PRIMARY KEY CLUSTERED 
(
	[taxon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[UserCounts]    Script Date: 6/5/2018 8:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SampleTaxonomy](
	[SampleId] [int] NOT NULL,
	[Taxon] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Count_Norm] [int] NOT NULL,
 CONSTRAINT [PK_UserCounts] PRIMARY KEY CLUSTERED 
(
	[SampleId]  ASC,
	[Taxon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
