/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20100304
 *
 * Disassembly of dsdt.dat, Wed Apr  6 10:37:28 2011
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00004E12 (19986)
 *     Revision         0x02
 *     Checksum         0xA9
 *     OEM ID           "Pegaco"
 *     OEM Table ID     "H26"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x03000001 (50331649)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 2, "Pegaco", "H26", 0x00000001)
{
    External (LNKB)
    External (LNKA)

    OperationRegion (BIOS, SystemMemory, 0xBFD9E064, 0xFF)
    Field (BIOS, ByteAcc, NoLock, Preserve)
    {
        SS1,    1, 
        SS2,    1, 
        SS3,    1, 
        SS4,    1, 
                Offset (0x01), 
        IOST,   16, 
        TOPM,   32, 
        ROMS,   32, 
        MG1B,   32, 
        MG1L,   32, 
        MG2B,   32, 
        MG2L,   32, 
                Offset (0x1C), 
        DMAX,   8, 
        HPTA,   32, 
        CPB0,   32, 
        CPB1,   32, 
        CPB2,   32, 
        CPB3,   32, 
        ASSB,   8, 
        AOTB,   8, 
        AAXB,   32, 
        SMIF,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        MPEN,   8, 
        TPMF,   8, 
        MG3B,   32, 
        MG3L,   32, 
        MH1B,   32, 
        MH1L,   32, 
                Offset (0x80), 
        CTJM,   8, 
        BTPR,   1, 
        WLPR,   1, 
        WWPR,   1, 
        WXPR,   1, 
        D1PR,   1, 
        D2PR,   1, 
        D3PR,   1, 
        D4PR,   1, 
        CNTD,   16, 
        ACTD,   16
    }

    Name (DPST, Package (0x02)
    {
        0x00, 
        0x00
    })
    OperationRegion (\GPIO, SystemIO, 0x0500, 0x40)
    Field (\GPIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x0C), 
        GL00,   16, 
        GL10,   16, 
                Offset (0x18), 
        GB00,   32, 
                Offset (0x2C), 
        GP00,   16, 
                Offset (0x38), 
        GL20,   32
    }

    OperationRegion (\COEM, SystemIO, 0x74, 0x02)
    Field (\COEM, ByteAcc, Lock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
                Offset (0x50), 
        BRLV,   4, 
                Offset (0x51), 
        WLFG,   1, 
        BTFG,   1
    }

    OperationRegion (P80, SystemIO, 0x80, 0x01)
    Field (P80, ByteAcc, NoLock, Preserve)
    {
        DBGP,   8
    }

    OperationRegion (PB2, SystemIO, 0xB2, 0x01)
    Field (PB2, ByteAcc, NoLock, Preserve)
    {
        SMIP,   8
    }

    OperationRegion (SMIE, SystemIO, 0x0830, 0x04)
    Field (SMIE, ByteAcc, NoLock, Preserve)
    {
            ,   4, 
        SSE,    1
    }

    OperationRegion (SMIS, SystemIO, 0x0834, 0x04)
    Field (SMIS, ByteAcc, NoLock, WriteAsZeros)
    {
            ,   4, 
        SSS,    1
    }

    Name (_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S1, Package (0x04)
    {
        0x01, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x04)
    {
        0x05, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S4, Package (0x04)
    {
        0x06, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S5, Package (0x04)
    {
        0x07, 
        0x00, 
        0x00, 
        0x00
    })
    Name (PICM, 0x00)
    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, PICM)
    }

    Scope (_PR)
    {
        Processor (P001, 0x01, 0x00000810, 0x06) {}
        Alias (P001, CPU1)
    }

    Scope (_PR)
    {
        Processor (P002, 0x02, 0x00000810, 0x06) {}
        Alias (P002, CPU2)
    }

    Scope (_SB)
    {
        Device (SB)
        {
            Name (_HID, EisaId ("PNP0C01"))
            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x000A0000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0x000C0000,         // Address Base
                        0x00040000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0x00100000,         // Address Base
                        0x00200000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00300000,         // Address Base
                        0x00000000,         // Address Length
                        _Y00)
                })
                CreateDWordField (CRS, \_SB.SB._CRS._Y00._LEN, FLEN)
                Subtract (MG2B, 0x00300000, FLEN)
                Return (CRS)
            }
        }

        Device (PILA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x00)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRA, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y01)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILA._CRS._Y01._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRA, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRA)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRA)
                }
            }
        }

        Device (PILB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x01)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRB, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y02)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILB._CRS._Y02._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRB, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRB)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRB)
                }
            }
        }

        Device (PILC)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRC, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y03)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILC._CRS._Y03._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRC, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRC)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRC)
                }
            }
        }

        Device (PILD)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x03)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRD, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y04)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILD._CRS._Y04._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRD, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRD)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRD)
                }
            }
        }

        Device (PILE)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRE, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRE)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y05)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILE._CRS._Y05._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRE, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRE)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRE)
                }
            }
        }

        Device (PILF)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x05)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRF, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRF)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y06)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILF._CRS._Y06._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRF, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRF)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRF)
                }
            }
        }

        Device (PILG)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x06)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRG, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRG)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y07)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILG._CRS._Y07._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRG, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRG)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRG)
                }
            }
        }

        Device (PILH)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x07)
            Method (_STA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.PIRH, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (0x80, \_SB.PCI0.ISA.PIRH)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y08)
                        {0}
                })
                CreateWordField (CRS, \_SB.PILH._CRS._Y08._INT, FIRQ)
                And (ShiftLeft (0x01, And (\_SB.PCI0.ISA.PIRH, 0x0F)), 0xFFFE, FIRQ)
                Return (CRS)
            }

            Name (_PRS, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, FIRQ)
                If (FIRQ)
                {
                    Subtract (FindSetRightBit (FIRQ), 0x01, \_SB.PCI0.ISA.PIRH)
                }
                Else
                {
                    Store (0x80, \_SB.PCI0.ISA.PIRH)
                }
            }
        }

        Device (PCI0)
        {
            Name (_ADR, 0x00)
            Name (_HID, EisaId ("PNP0A03"))
            Method (_CRS, 0, NotSerialized)
            {
                Name (CRS, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0100,             // Length
                        ,, )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0CF7,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0CF8,             // Length
                        ,, , TypeStatic)
                    IO (Decode16,
                        0x0CF8,             // Range Minimum
                        0x0CF8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0D00,             // Range Minimum
                        0xFFFF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0xF300,             // Length
                        ,, , TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000A0000,         // Range Minimum
                        0x000BFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x00000000,         // Range Minimum
                        0xDFFFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00000000,         // Length
                        ,, _Y09, AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0xF0000000,         // Range Minimum
                        0xFFFFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x10000000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (CRS, \_SB.PCI0._CRS._Y09._MIN, FMIN)
                CreateDWordField (CRS, \_SB.PCI0._CRS._Y09._LEN, FLEN)
                Store (MG2B, FMIN)
                Add (Subtract (0xDFFFFFFF, FMIN), 0x01, FLEN)
                Return (CRS)
            }

            Method (_PRT, 0, NotSerialized)
            {
                Name (PRT0, Package (0x1A)
                {
                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        PILA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        PILB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x02, 
                        PILC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x03, 
                        PILD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x00, 
                        PILA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x00, 
                        PILA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x03, 
                        PILD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x02, 
                        PILC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x01, 
                        PILB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x00, 
                        PILC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x01, 
                        PILD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x02, 
                        PILC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x00, 
                        PILH, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x01, 
                        PILD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x02, 
                        PILC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x03, 
                        PILA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x00, 
                        PILA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x01, 
                        PILF, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x03, 
                        PILD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x02, 
                        PILC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001BFFFF, 
                        0x00, 
                        PILG, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0019FFFF, 
                        0x00, 
                        PILE, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x00, 
                        PILB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x01, 
                        PILA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x02, 
                        PILC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x03, 
                        PILD, 
                        0x00
                    }
                })
                Name (PRT1, Package (0x1A)
                {
                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x00, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x01, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x00, 
                        0x00, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x01, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x01, 
                        0x00, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x001AFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001BFFFF, 
                        0x00, 
                        0x00, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0019FFFF, 
                        0x00, 
                        0x00, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x00, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x01, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x001CFFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }
                })
                If (PICM)
                {
                    Return (PRT1)
                }
                Else
                {
                    Return (PRT0)
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x0D, 
                0x04
            })
            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    Name (PRT0, Package (0x02)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            PILA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            PILB, 
                            0x00
                        }
                    })
                    Name (PRT1, Package (0x02)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }
                    })
                    If (PICM)
                    {
                        Return (PRT1)
                    }
                    Else
                    {
                        Return (PRT0)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Device (ATIG)
                {
                    Name (_ADR, 0x00)
                    Method (_DOS, 1, NotSerialized)
                    {
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x04)
                        {
                            0x00010100, 
                            0x00010200, 
                            0x00010110, 
                            0x00010210
                        })
                    }

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (CRT)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (B08L, Package (0x0A)
                        {
                            0x32, 
                            0x58, 
                            0x0D, 
                            0x19, 
                            0x26, 
                            0x32, 
                            0x3F, 
                            0x4B, 
                            0x58, 
                            0x64
                        })
                        Name (B16L, Package (0x12)
                        {
                            0x32, 
                            0x58, 
                            0x06, 
                            0x0D, 
                            0x13, 
                            0x19, 
                            0x20, 
                            0x26, 
                            0x2C, 
                            0x32, 
                            0x39, 
                            0x3F, 
                            0x45, 
                            0x4B, 
                            0x52, 
                            0x58, 
                            0x5E, 
                            0x64
                        })
                        Name (SLBL, Package (0x00) {})
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }

                        Method (_BCL, 0, NotSerialized)
                        {
                            Return (B16L)
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            Store (Match (B16L, MEQ, Arg0, MTR, 0x00, 0x02), Local1)
                            Subtract (Local1, 0x02, Local1)
                            Store (Local1, \BRLV)
                            If (\_SB.PCI0.ISA.EC24 (0x01))
                            {
                                \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (\_SB.HOTK.APWM, Local1)))
                            }
                            Else
                            {
                                \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (\_SB.HOTK.BPWM, Local1)))
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            And (\BRLV, Subtract (SizeOf (B16L), 0x03), Local1)
                            Store (DerefOf (Index (B16L, Add (Local1, 0x02))), Local0)
                            Return (Local0)
                        }
                    }

                    Device (DVI)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0210)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Name (DSRQ, 0x00)
                    Name (ATIR, Buffer (0x0100) {})
                    Name (TDEV, 0x00)
                    Name (SFLG, 0x00)
                    Name (DSPS, Package (0x03)
                    {
                        Package (0x03)
                        {
                            0x01, 
                            0x03, 
                            0x02
                        }, 

                        Package (0x03)
                        {
                            0x01, 
                            0x81, 
                            0x80
                        }, 

                        Package (0x05)
                        {
                            0x01, 
                            0x03, 
                            0x02, 
                            0x81, 
                            0x80
                        }
                    })
                    Method (SWDP, 0, NotSerialized)
                    {
                        Store ("Switching Display Devices...", Debug)
                        Store (One, DSRQ)
                        If (LEqual (SFLG, Zero))
                        {
                            Store (0xD0, SMIP)
                            Store (One, SFLG)
                        }
                        Else
                        {
                            Store (CT10 (TDEV), \ACTD)
                        }

                        Store (SHOT (), Local1)
                        Sleep (0x01F4)
                    }

                    Method (SDPD, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.HOTK.OSV, 0x20))
                        {
                            Notify (ATIG, 0x81)
                        }
                        Else
                        {
                            Store (CT10 (TDEV), \ACTD)
                            Store (0xD1, SMIP)
                        }

                        Store (Zero, SFLG)
                    }

                    Method (SHOT, 0, NotSerialized)
                    {
                        If (LEqual (\CNTD, 0x0400))
                        {
                            Store (Zero, SFLG)
                            Return (0xFFFF)
                        }

                        Store (CTAD (), Local1)
                        Store (CTCD (), Local2)
                        Store (GSDD (Local1, Local2), Local0)
                        Store (Local0, TDEV)
                        SNXT (Local0)
                        Return (Local0)
                    }

                    Method (CTAD, 0, NotSerialized)
                    {
                        Store (Zero, Local0)
                        If (And (\ACTD, 0x02))
                        {
                            Or (Local0, 0x01, Local0)
                        }

                        If (And (\ACTD, 0x01))
                        {
                            Or (Local0, 0x02, Local0)
                        }

                        If (And (\ACTD, 0x80))
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Return (Local0)
                    }

                    Method (CTCD, 0, NotSerialized)
                    {
                        Store (Zero, Local0)
                        If (And (\CNTD, 0x0400)) {}
                        If (And (\CNTD, 0x02))
                        {
                            Or (Local0, 0x02, Local0)
                        }

                        If (And (\CNTD, 0x0200))
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Return (Local0)
                    }

                    Method (CT10, 1, NotSerialized)
                    {
                        Store (Zero, Local0)
                        If (And (Arg0, 0x01))
                        {
                            Or (Local0, 0x02, Local0)
                        }

                        If (And (Arg0, 0x02))
                        {
                            Or (Local0, 0x01, Local0)
                        }

                        If (And (Arg0, 0x80))
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Return (Local0)
                    }

                    Method (SNXT, 1, NotSerialized)
                    {
                        Store (Arg0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Notify (\_SB.HOTK, 0x61)
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x02))
                            {
                                Notify (\_SB.HOTK, 0x62)
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    Notify (\_SB.HOTK, 0x63)
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x80))
                                    {
                                        Notify (\_SB.HOTK, 0xA0)
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x81))
                                        {
                                            Notify (\_SB.HOTK, 0xA1)
                                        }
                                        Else
                                        {
                                            Store ("Show Next Selected Display Error", Debug)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Method (GSDD, 2, Serialized)
                    {
                        Store ("--GSDD (Get Selected Display Device)--", Debug)
                        Store (GSDP (Arg1), Local1)
                        Store (GNXT (Arg0, Local1), Local2)
                        Store (DerefOf (Index (Local1, Local2)), Local0)
                        Return (Local0)
                    }

                    Method (GSDP, 1, NotSerialized)
                    {
                        Store ("--GSDP (Get Displays Switch Sequence Package)--", Debug)
                        Store (Arg0, Local2)
                        If (LEqual (Local2, 0x02))
                        {
                            Store (0x00, Local1)
                        }
                        Else
                        {
                            If (LEqual (Local2, 0x80))
                            {
                                Store (0x01, Local1)
                            }
                            Else
                            {
                                If (LEqual (Local2, 0x82))
                                {
                                    Store (0x02, Local1)
                                }
                                Else
                                {
                                    Store (" Get Displays Switch Sequence Error", Debug)
                                }
                            }
                        }

                        Store (DerefOf (Index (DSPS, Local1)), Local0)
                        Return (Local0)
                    }

                    Method (GNXT, 2, NotSerialized)
                    {
                        Store ("--GNXT (Get Next Index in DSS Package)--", Debug)
                        Store (Match (Arg1, MEQ, Arg0, MTR, 0x00, 0x00), Local1)
                        Store (SizeOf (Arg1), Local2)
                        Subtract (Local2, 0x01, Local2)
                        Store ("Current Index", Debug)
                        Store (Local1, Debug)
                        Store ("Max Index", Debug)
                        Store (Local2, Debug)
                        If (LEqual (Local1, Local2))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Add (Local1, 0x01, Local0)
                        }

                        Store ("Final Index", Debug)
                        Store (Local0, Debug)
                        Return (Local0)
                    }

                    Method (ATIF, 2, NotSerialized)
                    {
                        Store ("--ATIF--", Debug)
                        Store (Arg0, Debug)
                        While (One)
                        {
                            Name (_T_0, 0x00)
                            Store (ToInteger (Arg0), _T_0)
                            If (LEqual (_T_0, 0x00))
                            {
                                Return (ATF0 (Arg0, Arg1))
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x01))
                                {
                                    Return (ATF1 (Arg0, Arg1))
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x02))
                                    {
                                        Return (ATF2 (Arg0, Arg1))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x03))
                                        {
                                            Return (ATF3 (Arg0, Arg1))
                                        }
                                    }
                                }
                            }

                            Break
                        }
                    }

                    Method (ATF0, 2, NotSerialized)
                    {
                        Store ("--ATF0--", Debug)
                        CreateWordField (ATIR, 0x00, SSZE)
                        CreateWordField (ATIR, 0x02, IVER)
                        CreateDWordField (ATIR, 0x04, SNMK)
                        CreateDWordField (ATIR, 0x08, SFBK)
                        Store (0x0C, SSZE)
                        Store (0x01, IVER)
                        Store (0x01, SNMK)
                        Store (0x07, SFBK)
                        Store (ATIR, Debug)
                        Return (ATIR)
                    }

                    Method (ATF1, 2, NotSerialized)
                    {
                        Store ("--ATF1--", Debug)
                        CreateWordField (ATIR, 0x00, SSZE)
                        CreateDWordField (ATIR, 0x02, VFMK)
                        CreateDWordField (ATIR, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x03, VFMK)
                        Store (0x01, FLGS)
                        Return (ATIR)
                    }

                    Method (ATF2, 2, NotSerialized)
                    {
                        Store ("--ATF2--", Debug)
                        CreateWordField (ATIR, 0x00, SSZE)
                        CreateDWordField (ATIR, 0x02, PSBR)
                        CreateByteField (ATIR, 0x06, EMOD)
                        CreateByteField (ATIR, 0x07, TTGC)
                        CreateByteField (ATIR, 0x08, TSID)
                        CreateByteField (ATIR, 0x09, FTGC)
                        CreateByteField (ATIR, 0x0A, FSID)
                        CreateByteField (ATIR, 0x0B, SPSC)
                        Store (0x0C, SSZE)
                        Store (DSRQ, PSBR)
                        Store (Zero, EMOD)
                        Store (Zero, TTGC)
                        Store (Zero, TSID)
                        Store (Zero, FTGC)
                        Store (Zero, FSID)
                        Store (Zero, SPSC)
                        Store (Zero, DSRQ)
                        Return (ATIR)
                    }

                    Method (ATF3, 2, NotSerialized)
                    {
                        Store ("--ATF3--", Debug)
                        CreateWordField (Arg1, 0x00, ISZE)
                        CreateWordField (Arg1, 0x02, ISDS)
                        CreateWordField (Arg1, 0x04, ICDP)
                        Store ("--Input--", Debug)
                        Store (ISDS, Debug)
                        Store (ICDP, Debug)
                        CreateWordField (ATIR, 0x00, SSZE)
                        CreateWordField (ATIR, 0x02, SDIS)
                        Store (0x04, SSZE)
                        Store (TDEV, Local0)
                        Store (Local0, SDIS)
                        Store ("--Ouput--", Debug)
                        Store (ATIR, Debug)
                        Return (ATIR)
                    }
                }
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
                Name (PR01, Package (0x02)
                {
                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        LNKB, 
                        0x00
                    }
                })
                Name (AR01, Package (0x02)
                {
                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }
            }

            Device (RP1)
            {
                Name (_ADR, 0x001C0000)
                Method (_PRT, 0, NotSerialized)
                {
                    Name (PRT0, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            PILA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            PILB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            PILC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            PILD, 
                            0x00
                        }
                    })
                    Name (PRT1, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                    If (PICM)
                    {
                        Return (PRT1)
                    }
                    Else
                    {
                        Return (PRT0)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })
                }
            }

            Device (RP2)
            {
                Name (_ADR, 0x001C0001)
                Method (_PRT, 0, NotSerialized)
                {
                    Name (PRT0, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            PILB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            PILC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            PILD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            PILA, 
                            0x00
                        }
                    })
                    Name (PRT1, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }
                    })
                    If (PICM)
                    {
                        Return (PRT1)
                    }
                    Else
                    {
                        Return (PRT0)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })
                }
            }

            Device (RP3)
            {
                Name (_ADR, 0x001C0002)
                Method (_PRT, 0, NotSerialized)
                {
                    Name (PRT0, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            PILC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            PILD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            PILA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            PILB, 
                            0x00
                        }
                    })
                    Name (PRT1, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }
                    })
                    If (PICM)
                    {
                        Return (PRT1)
                    }
                    Else
                    {
                        Return (PRT0)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })
                }
            }

            Device (RP4)
            {
                Name (_ADR, 0x001C0003)
                Method (_PRT, 0, NotSerialized)
                {
                    Name (PRT0, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            PILD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            PILA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            PILB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            PILC, 
                            0x00
                        }
                    })
                    Name (PRT1, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }
                    })
                    If (PICM)
                    {
                        Return (PRT1)
                    }
                    Else
                    {
                        Return (PRT0)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })
                }

                Scope (\_GPE)
                {
                    Method (_L01, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.RP4.HPSX)
                        {
                            Sleep (0x03E8)
                            If (\_SB.PCI0.RP4.PDCX)
                            {
                                Store (0x01, \_SB.PCI0.RP4.PDCX)
                                Store (0x01, \_SB.PCI0.RP4.LSCX)
                                Store (0x01, \_SB.PCI0.RP4.HPSX)
                                Sleep (0x03E8)
                                Notify (\_SB.PCI0.RP4, 0x00)
                            }
                            Else
                            {
                                Store (0x01, \_SB.PCI0.RP4.HPSX)
                            }
                        }
                    }
                }

                Scope (\_SB.PCI0.RP4)
                {
                    OperationRegion (PCIC, PCI_Config, 0x40, 0xC0)
                    Field (PCIC, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1A), 
                            ,   3, 
                        PDCX,   1, 
                            ,   2, 
                        PDSX,   1, 
                                Offset (0x1B), 
                        LSCX,   1, 
                                Offset (0x9C), 
                            ,   30, 
                        HPSX,   1
                    }
                }

                Device (EXCD)
                {
                    Name (_ADR, 0x00)
                    Name (_S3D, 0x03)
                    Name (_HPP, Package (0x04)
                    {
                        0x08, 
                        0x40, 
                        0x01, 
                        0x00
                    })
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.RP4.PDSX, 0x00))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }
            }

            Device (RP5)
            {
                Name (_ADR, 0x001C0004)
                Method (_PRT, 0, NotSerialized)
                {
                    Name (PRT0, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            PILA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            PILB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            PILC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            PILD, 
                            0x00
                        }
                    })
                    Name (PRT1, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                    If (PICM)
                    {
                        Return (PRT1)
                    }
                    Else
                    {
                        Return (PRT0)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })
                }
            }

            Device (RP6)
            {
                Name (_ADR, 0x001C0005)
                Method (_PRT, 0, NotSerialized)
                {
                    Name (PRT0, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            PILB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            PILC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            PILD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            PILA, 
                            0x00
                        }
                    })
                    Name (PRT1, Package (0x04)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x01, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x02, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0xFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }
                    })
                    If (PICM)
                    {
                        Return (PRT1)
                    }
                    Else
                    {
                        Return (PRT0)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x03
                    })
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)
                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (USB5)
            {
                Name (_ADR, 0x001D0003)
                Name (_PRW, Package (0x02)
                {
                    0x20, 
                    0x03
                })
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB3)
            {
                Name (_ADR, 0x001A0000)
                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
            }

            Device (USB4)
            {
                Name (_ADR, 0x001A0001)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (USB6)
            {
                Name (_ADR, 0x001A0002)
                Name (_PRW, Package (0x02)
                {
                    0x20, 
                    0x03
                })
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (ISA)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (PCIC, PCI_Config, 0x00, 0x0100)
                Field (PCIC, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                            Offset (0x68), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer16, )
                            {4}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (PIT)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN2106"))
                    Name (_CID, Package (0x03)
                    {
                        EisaId ("SYN2100"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (ECIO)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x01)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0100,             // Range Minimum
                            0x0100,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                }

                OperationRegion (BRAM, SystemIO, 0x0100, 0x02)
                Field (BRAM, ByteAcc, NoLock, Preserve)
                {
                    IEC,    8, 
                    DEC,    8
                }

                IndexField (IEC, DEC, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x02), 
                    CMD,    8, 
                    STS,    8, 
                    DB0,    8, 
                    DB1,    8, 
                    DB2,    8, 
                    DB3,    8, 
                    DB4,    8, 
                    DB5,    8, 
                    DB6,    8, 
                    DB7,    8, 
                    DB8,    8, 
                    DB9,    8, 
                    DB10,   8, 
                    DB11,   8, 
                    DB12,   8, 
                    DB13,   8
                }

                Mutex (MEC, 0x00)
                Scope (\_GPE)
                {
                    Method (_L1B, 0, NotSerialized)
                    {
                        \_SB.PCI0.ISA.EEC ()
                    }
                }

                Name (ACST, 0xFF)
                Method (EEC, 0, NotSerialized)
                {
                    While (0x01)
                    {
                        Store (EC21 (), Local0)
                        If (LEqual (Local0, 0xFF))
                        {
                            Break
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            Store ("AC Event", Debug)
                            \_SB.AC.EAC ()
                            \_SB.BAT.EAC ()
                            Store (\_SB.PCI0.ISA.EC24 (0x01), Local0)
                            If (LEqual (ACST, 0xFF))
                            {
                                Store (Local0, ACST)
                            }
                            Else
                            {
                                If (LEqual (Local0, ACST)) {}
                                Else
                                {
                                    \_SB.HOTK.EAC ()
                                    Store (Local0, ACST)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x02))
                            {
                                Store ("Battery Event", Debug)
                                \_SB.BAT.EBAT ()
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    \_SB.LID.ELID (EC24 (0x03))
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x10))
                                    {
                                        Store (EC24 (0x10), Local1)
                                        If (And (Local1, 0x01))
                                        {
                                            \_SB.BAT.ET0 ()
                                        }

                                        If (And (Local1, 0x02))
                                        {
                                            \_SB.BAT.ET1 ()
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x11))
                                        {
                                            \_TZ.ETZ0 ()
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x12))
                                            {
                                                \_SB.HOTK.HKET (EC24 (0x12))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (EC21, 0, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (0x21, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Store (DB0, Local0)
                    Release (MEC)
                    Return (Local0)
                }

                Method (EC24, 1, Serialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (0x24, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Store (DB0, Local0)
                    Release (MEC)
                    Return (Local0)
                }

                Method (EC41, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (Arg1, DB1)
                    Store (0x41, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Add (Add (ShiftLeft (DB4, 0x10), ShiftLeft (DB6, 0x08)
                        ), DB5, Local0)
                    Release (MEC)
                    Return (Local0)
                }

                Method (EC44, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (Arg1, DB1)
                    Store (0x44, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Add (ShiftLeft (DB6, 0x08), DB5, Local0)
                    Release (MEC)
                    Return (Local0)
                }

                Method (EC46, 1, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (0x46, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Store (DB0, Local0)
                    Release (MEC)
                    Return (Local0)
                }

                Method (EC48, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    And (Arg1, 0xFF, DB1)
                    ShiftRight (Arg1, 0x08, DB2)
                    Store (0x48, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Release (MEC)
                }

                Method (EC50, 1, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (0x50, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Store (DB1, Local0)
                    Release (MEC)
                    Return (Local0)
                }

                Method (EC51, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    And (Arg1, 0xFF, DB1)
                    ShiftRight (Arg1, 0x08, DB2)
                    Store (0x51, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Release (MEC)
                }

                Method (EC52, 3, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    And (Arg0, 0xFF000000, Local0)
                    ShiftRight (Local0, 0x18, DB0)
                    And (Arg0, 0x00FF0000, Local0)
                    ShiftRight (Local0, 0x10, DB1)
                    And (Arg0, 0xFF00, Local0)
                    ShiftRight (Local0, 0x08, DB2)
                    If (LEqual (DB0, 0x00))
                    {
                        Store (0x52, CMD)
                        While (CMD)
                        {
                            Sleep (0x01)
                        }
                    }
                    Else
                    {
                        And (Arg0, 0xFF, Local0)
                        Store (Local0, DB3)
                        And (Arg1, 0xFF000000, Local0)
                        ShiftRight (Local0, 0x18, DB4)
                        And (Arg1, 0x00FF0000, Local0)
                        ShiftRight (Local0, 0x10, DB5)
                        And (Arg1, 0xFF00, Local0)
                        ShiftRight (Local0, 0x08, DB6)
                        And (Arg1, 0xFF, Local0)
                        Store (Local0, DB7)
                        And (Arg2, 0xFF000000, Local0)
                        ShiftRight (Local0, 0x18, DB8)
                        And (Arg2, 0x00FF0000, Local0)
                        ShiftRight (Local0, 0x10, DB9)
                        And (Arg2, 0xFF00, Local0)
                        ShiftRight (Local0, 0x08, DB10)
                        Store (0x52, CMD)
                        While (CMD)
                        {
                            Sleep (0x01)
                        }

                        And (Arg2, 0x00FF0000, Local0)
                        ShiftRight (Local0, 0x10, DB9)
                        If (LEqual (DB9, 0x01))
                        {
                            Store (0x01, DB0)
                            And (Arg0, 0x00FF0000, Local0)
                            ShiftRight (Local0, 0x10, DB1)
                            Store (0x01, DB2)
                            Store (0xAE, DB3)
                            Store (0x5C, CMD)
                            While (CMD)
                            {
                                Sleep (0x01)
                            }
                        }
                    }

                    Release (MEC)
                }

                Method (EC53, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (Arg1, DB1)
                    Store (0x53, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Store (DB0, Local0)
                    Release (MEC)
                    If (Arg0) {}
                    Else
                    {
                        Return (Local0)
                    }
                }

                Method (EC55, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    And (Arg1, 0xFF00, Local1)
                    ShiftRight (Local1, 0x08, DB1)
                    And (Arg1, 0xFF, DB2)
                    Store (0x55, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Release (MEC)
                }

                Method (EC57, 1, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (0x57, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Release (MEC)
                }

                Method (EC58, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (Arg1, DB1)
                    Store (0x58, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Release (MEC)
                }

                Method (EC62, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (Arg1, DB1)
                    Store (0x62, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Store (DB0, Local0)
                        Release (MEC)
                        Return (Local0)
                    }
                    Else
                    {
                        Release (MEC)
                    }
                }

                Method (EC63, 2, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    And (ShiftRight (Arg0, 0x04), 0x01, Local0)
                    If (Local0)
                    {
                        Store (Arg1, DB1)
                    }

                    Store (0x63, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    If (LEqual (Local0, 0x00))
                    {
                        Store (DB0, Local1)
                        Release (MEC)
                        Return (Local1)
                    }
                    Else
                    {
                        Release (MEC)
                    }
                }

                Method (RBBD, 3, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (Arg1, DB1)
                    Store (0x45, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Store (DB4, Local4)
                    Store (DB5, Local3)
                    Add (ShiftLeft (Local4, 0x08), Local3, Local0)
                    If (LEqual (Local4, 0x00))
                    {
                        Store (0x00, Local1)
                        While (Local3)
                        {
                            If (LLess (Local3, 0x0E))
                            {
                                Store (Local3, Local2)
                            }
                            Else
                            {
                                Store (0x0E, Local2)
                            }

                            Store (Arg0, DB0)
                            Store (Local1, DB1)
                            Store (Local2, DB2)
                            Store (0x47, CMD)
                            While (CMD)
                            {
                                Sleep (0x01)
                            }

                            Decrement (Local1)
                            Store (DB0, Index (Arg2, Increment (Local1)))
                            Store (DB1, Index (Arg2, Increment (Local1)))
                            Store (DB2, Index (Arg2, Increment (Local1)))
                            Store (DB3, Index (Arg2, Increment (Local1)))
                            Store (DB4, Index (Arg2, Increment (Local1)))
                            Store (DB5, Index (Arg2, Increment (Local1)))
                            Store (DB6, Index (Arg2, Increment (Local1)))
                            Store (DB7, Index (Arg2, Increment (Local1)))
                            Store (DB8, Index (Arg2, Increment (Local1)))
                            Store (DB9, Index (Arg2, Increment (Local1)))
                            Store (DB10, Index (Arg2, Increment (Local1)))
                            Store (DB11, Index (Arg2, Increment (Local1)))
                            Store (DB12, Index (Arg2, Increment (Local1)))
                            Store (DB13, Index (Arg2, Increment (Local1)))
                            Subtract (Local3, Local2, Local3)
                        }
                    }

                    Release (MEC)
                    Return (Local0)
                }

                Method (ECEF, 1, NotSerialized)
                {
                    Acquire (MEC, 0xFFFF)
                    Store (Arg0, DB0)
                    Store (0xEF, CMD)
                    While (CMD)
                    {
                        Sleep (0x01)
                    }

                    Release (MEC)
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                }

                Device (PNP)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x00)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x01,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x09,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0378,             // Range Minimum
                            0x0378,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x40,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x80,               // Alignment
                            0x80,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFEC00000,         // Address Base
                            0x00000100,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFED10000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFED18000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFED19000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFF800000,         // Address Base
                            0x00800000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFED30000,         // Address Base
                            0x00010000,         // Address Length
                            )
                    })
                }
            }
        }

        Device (AC)
        {
            Method (_INI, 0, NotSerialized)
            {
                Store (0xFF, PSR)
            }

            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_PSR, 0, NotSerialized)
            {
                If (LEqual (PSR, 0xFF))
                {
                    Store (\_SB.PCI0.ISA.EC24 (0x01), PSR)
                }

                Return (PSR)
            }

            Method (EAC, 0, NotSerialized)
            {
                Store (0xFF, PSR)
                Notify (\_SB.AC, 0x80)
                Store (And (\BRLV, Subtract (SizeOf (\_SB.HOTK.APWM), 0x01)), Local0)
                If (\_SB.PCI0.ISA.EC24 (0x01))
                {
                    \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (\_SB.HOTK.APWM, Local0)))
                }
                Else
                {
                    \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (\_SB.HOTK.BPWM, Local0)))
                }
            }

            Name (PSR, 0xFF)
        }

        Device (BAT)
        {
            Method (_INI, 0, NotSerialized)
            {
                Store (0xFF, STA)
                Store (0xFF, BIFS)
                Store (0x00, BIFR)
                Store (0xFF, BSTS)
                Store (0x00, BSTI)
                Store (0x00, BIFC)
            }

            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x00)
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (STA, 0xFF))
                {
                    USTA ()
                }

                Return (STA)
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (LEqual (BIFS, 0xFF))
                {
                    UBIF ()
                }

                If (LEqual (BIFS, 0x01))
                {
                    Return (BIFP)
                }
                Else
                {
                    Return (BIFU)
                }
            }

            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BSTS, 0xFF))
                {
                    UBST ()
                }

                If (LEqual (BSTS, 0x01))
                {
                    Return (BSTP)
                }
                Else
                {
                    Return (BSTU)
                }
            }

            Method (EAC, 0, NotSerialized)
            {
                Sleep (0x01F4)
                Store (0xFF, BSTS)
                Store (0x00, BSTI)
            }

            Method (EBAT, 0, NotSerialized)
            {
                _INI ()
                Sleep (0x07D0)
                If (LEqual (BIFS, 0xFF))
                {
                    UBIF ()
                }

                Notify (\_SB.BAT, 0x81)
                Notify (\_SB.BAT, 0x80)
                If (LNotEqual (BIFS, 0x01))
                {
                    \_SB.PCI0.ISA.EC48 (0x00, 0xC8)
                }
            }

            Method (ET0, 0, NotSerialized)
            {
                If (LGreaterEqual (BIFR, 0x03))
                {
                    Return (0x00)
                }

                If (LNotEqual (BIFS, 0x01))
                {
                    UBIF ()
                }

                If (LEqual (BIFS, 0x01))
                {
                    Notify (\_SB.BAT, 0x81)
                }
                Else
                {
                    Increment (BIFR)
                    \_SB.PCI0.ISA.EC48 (0x00, 0xC8)
                }
            }

            Method (ET1, 0, NotSerialized)
            {
                If (LNot (And (_STA (), 0x10)))
                {
                    Store (0x00, BSTS)
                    Return (0x00)
                }

                If (LEqual (BSTS, 0xFF))
                {
                    Notify (\_SB.BAT, 0x80)
                }
                Else
                {
                    Store (0xFF, BSTS)
                }

                Store (DerefOf (Index (BSTT, BSTI)), Local0)
                Store (DerefOf (Index (BSTN, BSTI)), BSTI)
                \_SB.PCI0.ISA.EC48 (0x01, Local0)
            }

            Name (BIFP, Package (0x0D)
            {
                0x00, 
                0x00, 
                0x00, 
                0x01, 
                0x00, 
                0x0B90, 
                0x0128, 
                0x0A, 
                0x0A, 
                "LIP909", 
                "", 
                "LIon", 
                "Pegatron"
            })
            Name (BIFU, Package (0x0D)
            {
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                "Unknown", 
                "0", 
                "Unknown", 
                0x00
            })
            Name (BSTP, Package (0x04)
            {
                0x00, 
                0x00, 
                0x00, 
                0x00
            })
            Name (BSTU, Package (0x04)
            {
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Name (STA, 0xFF)
            Name (BIFS, 0xFF)
            Name (BIFR, 0x00)
            Name (BSTS, 0xFF)
            Name (BSTI, 0x00)
            Name (BSTN, Package (0x03)
            {
                0x01, 
                0x02, 
                0x02
            })
            Name (BSTT, Package (0x03)
            {
                0x0258, 
                0x03E8, 
                0x1F40
            })
            Name (BIFC, 0x00)
            Method (UBIF, 0, NotSerialized)
            {
                Name (BBDB, Buffer (0x20) {})
                Name (BF21, "STR21")
                Name (BF22, "STR22")
                If (LNot (And (_STA (), 0x10)))
                {
                    Store (0x00, BIFS)
                    Return (0x00)
                }

                While (LNot (And (\_SB.PCI0.ISA.EC46 (0x00), 0x08)))
                {
                    Store (\_SB.PCI0.ISA.EC41 (0x00, 0x18), Local0)
                    If (And (Local0, 0x00FF0000))
                    {
                        Continue
                    }

                    Multiply (And (Local0, 0xFFFF), 0x0A, Index (BIFP, 0x01))
                    Store (\_SB.PCI0.ISA.EC41 (0x00, 0x10), Local0)
                    If (And (Local0, 0x00FF0000))
                    {
                        Continue
                    }

                    Multiply (And (Local0, 0xFFFF), 0x0A, Local1)
                    Store (Local1, Index (BIFP, 0x02))
                    Store (\_SB.PCI0.ISA.EC41 (0x00, 0x19), Local0)
                    If (And (Local0, 0x00FF0000))
                    {
                        Continue
                    }

                    And (Local0, 0xFFFF, Index (BIFP, 0x04))
                    Store (0x01, BIFS)
                    ET1 ()
                    Return (0x00)
                }

                Store (0x00, BIFS)
            }

            Method (UBST, 0, NotSerialized)
            {
                If (LNot (And (_STA (), 0x10)))
                {
                    Store (0x00, BSTS)
                    Return (0x00)
                }

                While (0x01)
                {
                    Store (\_SB.PCI0.ISA.EC46 (0x00), Local0)
                    If (And (Local0, 0x08))
                    {
                        Store (0x00, BSTS)
                        Return (0x00)
                    }

                    If (And (Local0, 0x10))
                    {
                        Break
                    }

                    Sleep (0x01F4)
                }

                Store (0x00, Local0)
                If (And (\_SB.PCI0.ISA.EC44 (0x00, 0x16), 0x40))
                {
                    Or (Local0, 0x01, Local0)
                    If (LEqual (BIFC, 0x01))
                    {
                        Store (0xFF, BIFS)
                        Notify (\_SB.BAT, 0x81)
                    }

                    Store (0x00, BIFC)
                }
                Else
                {
                    If (LEqual (\_SB.AC._PSR (), 0x01))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (0x01, BIFC)
                }

                If (And (\_SB.PCI0.ISA.EC46 (0x00), 0x04))
                {
                    Or (Local0, 0x04, Local0)
                }

                Store (Local0, Index (BSTP, 0x00))
                Store (\_SB.PCI0.ISA.EC44 (0x00, 0x09), Local0)
                Store (Local0, Index (BSTP, 0x03))
                Store (\_SB.PCI0.ISA.EC41 (0x00, 0x0A), Local1)
                And (Local1, 0xFFFF, Local1)
                If (LGreaterEqual (Local1, 0x8000))
                {
                    Not (Local1, Local1)
                    Increment (Local1)
                    And (Local1, 0xFFFF, Local1)
                }

                Multiply (Local1, Local0, Local0)
                Divide (Local0, 0x03E8, , Index (BSTP, 0x01))
                Multiply (\_SB.PCI0.ISA.EC44 (0x00, 0x0F), 0x0A, Local2)
                Store (Local2, Index (BSTP, 0x02))
                Store (0x01, BSTS)
            }

            Method (USTA, 0, NotSerialized)
            {
                If (And (\_SB.PCI0.ISA.EC24 (0x02), 0x01))
                {
                    Store (0x1F, STA)
                }
                Else
                {
                    Store (0x0F, STA)
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Name (LIDS, 0x01)
            Method (_LID, 0, NotSerialized)
            {
                Store (\_SB.PCI0.ISA.EC24 (0x03), LIDS)
                Return (LIDS)
            }

            Method (ELID, 1, NotSerialized)
            {
                If (Arg0)
                {
                    \_SB.PCI0.ISA.EC62 (0x02, 0x9D)
                }
                Else
                {
                    \_SB.PCI0.ISA.EC62 (0x04, 0x9D)
                }

                Notify (LID, 0x80)
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (HOTK)
        {
            Name (_HID, "ATK0100")
            Name (_UID, 0x01010100)
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }

            Name (REGX, 0x00)
            Method (INIT, 1, NotSerialized)
            {
                Store (0x01, REGX)
                If (\WLPR)
                {
                    If (WLFG)
                    {
                        WLED (0x01)
                    }
                    Else
                    {
                        WLED (0x00)
                    }
                }
                Else
                {
                    WLED (0x00)
                }

                If (\BTPR)
                {
                    If (BTFG)
                    {
                        BLED (0x01)
                    }
                    Else
                    {
                        BLED (0x00)
                    }
                }
                Else
                {
                    BLED (0x00)
                }

                If (\_SB.PCI0.ISA.EC24 (0x01))
                {
                    \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (APWM, And (\BRLV, Subtract (SizeOf (APWM), 
                        0x01)))))
                }
                Else
                {
                    \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (BPWM, And (\BRLV, Subtract (SizeOf (APWM), 
                        0x01)))))
                }

                Return ("H26 ")
            }

            Method (BSTS, 0, NotSerialized)
            {
                Store (0x00, Local0)
                Return (Local0)
            }

            Method (SFUN, 0, NotSerialized)
            {
                Return (0x0807)
            }

            Name (OSV, 0x00)
            Method (OSVR, 1, NotSerialized)
            {
                Store (Arg0, OSV)
            }

            Method (RSTS, 0, NotSerialized)
            {
                Store (Add (Multiply (\BTFG, 0x02), \WLFG), Local0)
                Return (Local0)
            }

            Method (HWRS, 0, NotSerialized)
            {
                Store (0x0583, Local0)
                If (LEqual (\BTPR, 0x00))
                {
                    And (Local0, 0x06FF, Local0)
                }

                If (LEqual (\WLPR, 0x00))
                {
                    And (Local0, 0x077F, Local0)
                }

                Return (Local0)
            }

            Name (WAPF, Zero)
            Method (CWAP, 1, NotSerialized)
            {
                Or (Arg0, WAPF, WAPF)
                Return (0x01)
            }

            Method (WLED, 1, NotSerialized)
            {
                If (\WLPR)
                {
                    Store (Arg0, Local1)
                }
                Else
                {
                    Store (Zero, Local1)
                }

                If (Local1)
                {
                    \_SB.PCI0.ISA.EC62 (0x02, 0xBB)
                    Store (0x01, \WLFG)
                }
                Else
                {
                    \_SB.PCI0.ISA.EC62 (0x04, 0xBB)
                    Store (0x00, \WLFG)
                }

                Return (0x01)
            }

            Method (BLED, 1, NotSerialized)
            {
                If (\BTPR)
                {
                    Store (Arg0, Local1)
                }
                Else
                {
                    Store (Zero, Local1)
                }

                If (Local1)
                {
                    \_SB.PCI0.ISA.EC62 (0x02, 0xCA)
                    Or (\GL10, 0x0800, \GL10)
                    Store (0x01, \BTFG)
                }
                Else
                {
                    \_SB.PCI0.ISA.EC62 (0x04, 0xCA)
                    And (\GL10, Not (0x0800), \GL10)
                    Store (0x00, \BTFG)
                }

                Return (0x01)
            }

            Method (EAC, 0, NotSerialized)
            {
                If (REGX)
                {
                    If (\_SB.AC._PSR ())
                    {
                        Notify (\_SB.HOTK, 0x58)
                    }
                    Else
                    {
                        Notify (\_SB.HOTK, 0x57)
                    }
                }
            }

            Method (HKET, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Local0, DBGP)
                If (LEqual (Local0, 0x02))
                {
                    Notify (\_SB.SLPB, 0x80)
                }
                Else
                {
                    If (LEqual (Local0, 0x70))
                    {
                        If (REGX)
                        {
                            If (And (LEqual (\BTPR, 0x00), LEqual (\WLPR, 0x01)))
                            {
                                If (And (WAPF, 0x04))
                                {
                                    Notify (\_SB.HOTK, 0x5D)
                                }
                                Else
                                {
                                    If (\WLFG)
                                    {
                                        WLED (0x00)
                                        Notify (\_SB.HOTK, 0x5F)
                                    }
                                    Else
                                    {
                                        WLED (0x01)
                                        Notify (\_SB.HOTK, 0x5E)
                                    }
                                }
                            }
                            Else
                            {
                                If (And (LEqual (\BTPR, 0x01), LEqual (\WLPR, 0x00)))
                                {
                                    If (\BTFG)
                                    {
                                        BLED (0x00)
                                        Notify (\_SB.HOTK, 0x7E)
                                    }
                                    Else
                                    {
                                        BLED (0x01)
                                        Notify (\_SB.HOTK, 0x7D)
                                    }
                                }
                                Else
                                {
                                    If (And (LEqual (\BTPR, 0x00), LEqual (\WLPR, 0x00))) {}
                                    Else
                                    {
                                        If (And (WAPF, 0x04))
                                        {
                                            Notify (\_SB.HOTK, 0x88)
                                        }
                                        Else
                                        {
                                            If (LAnd (\BTFG, \WLFG))
                                            {
                                                WLED (0x01)
                                                BLED (0x00)
                                                Notify (\_SB.HOTK, 0x5E)
                                                Sleep (0x07D0)
                                                Notify (\_SB.HOTK, 0x7E)
                                            }
                                            Else
                                            {
                                                If (LAnd (Not (\BTFG), \WLFG))
                                                {
                                                    WLED (0x00)
                                                    BLED (0x01)
                                                    Notify (\_SB.HOTK, 0x5F)
                                                    Sleep (0x07D0)
                                                    Notify (\_SB.HOTK, 0x7D)
                                                }
                                                Else
                                                {
                                                    If (LAnd (\BTFG, Not (\WLFG)))
                                                    {
                                                        WLED (0x00)
                                                        BLED (0x00)
                                                        Notify (\_SB.HOTK, 0x5F)
                                                        Sleep (0x07D0)
                                                        Notify (\_SB.HOTK, 0x7E)
                                                    }
                                                    Else
                                                    {
                                                        WLED (0x01)
                                                        BLED (0x01)
                                                        Notify (\_SB.HOTK, 0x5E)
                                                        Sleep (0x07D0)
                                                        Notify (\_SB.HOTK, 0x7D)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Else
                    {
                        If (LEqual (Local0, 0x50))
                        {
                            If (\BTPR)
                            {
                                If (REGX)
                                {
                                    If (\BTFG)
                                    {
                                        BLED (0x00)
                                        Notify (\_SB.HOTK, 0x7E)
                                    }
                                    Else
                                    {
                                        BLED (0x01)
                                        Notify (\_SB.HOTK, 0x7D)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x55))
                            {
                                If (\WLPR)
                                {
                                    If (REGX)
                                    {
                                        If (And (WAPF, 0x04))
                                        {
                                            Notify (\_SB.HOTK, 0x5D)
                                        }
                                        Else
                                        {
                                            If (\WLFG)
                                            {
                                                WLED (0x00)
                                                Notify (\_SB.HOTK, 0x5F)
                                            }
                                            Else
                                            {
                                                WLED (0x01)
                                                Notify (\_SB.HOTK, 0x5E)
                                            }
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x99))
                                {
                                    If (REGX)
                                    {
                                        Notify (\_SB.HOTK, 0x50)
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x90))
                                    {
                                        If (REGX)
                                        {
                                            Notify (\_SB.HOTK, 0x51)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x57))
                                        {
                                            If (REGX)
                                            {
                                                And (\BRLV, Subtract (SizeOf (APWM), 0x01), Local1)
                                                If (LGreater (Local1, 0x00))
                                                {
                                                    Store (Decrement (Local1), Local1)
                                                    Notify (\_SB.PCI0.PEGP.ATIG.LCD, 0x87)
                                                }
                                                Else
                                                {
                                                    Store (0x00, Local1)
                                                }

                                                Store (Local1, \BRLV)
                                                Notify (\_SB.HOTK, Add (0x20, Local1))
                                                If (\_SB.PCI0.ISA.EC24 (0x01))
                                                {
                                                    \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (APWM, Local1)))
                                                }
                                                Else
                                                {
                                                    \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (BPWM, Local1)))
                                                }
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x56))
                                            {
                                                If (REGX)
                                                {
                                                    And (\BRLV, Subtract (SizeOf (APWM), 0x01), Local1)
                                                    If (LLess (Local1, Subtract (SizeOf (APWM), 0x01)))
                                                    {
                                                        Store (Increment (Local1), Local1)
                                                        Notify (\_SB.PCI0.PEGP.ATIG.LCD, 0x86)
                                                    }
                                                    Else
                                                    {
                                                        Store (Subtract (SizeOf (APWM), 0x01), Local1)
                                                    }

                                                    Store (Local1, \BRLV)
                                                    Notify (\_SB.HOTK, Add (0x10, Local1))
                                                    If (\_SB.PCI0.ISA.EC24 (0x01))
                                                    {
                                                        \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (APWM, Local1)))
                                                    }
                                                    Else
                                                    {
                                                        \_SB.PCI0.ISA.EC63 (0x14, DerefOf (Index (BPWM, Local1)))
                                                    }
                                                }
                                            }
                                            Else
                                            {
                                                If (LEqual (Local0, 0x88))
                                                {
                                                    If (REGX)
                                                    {
                                                        If (\_SB.PCI0.ISA.EC62 (0x01, 0x9D))
                                                        {
                                                            Notify (\_SB.HOTK, 0x34)
                                                            Sleep (0x07D0)
                                                            \_SB.PCI0.ISA.EC62 (0x04, 0x9D)
                                                        }
                                                        Else
                                                        {
                                                            Notify (\_SB.HOTK, 0x33)
                                                            \_SB.PCI0.ISA.EC62 (0x02, 0x9D)
                                                        }
                                                    }
                                                }
                                                Else
                                                {
                                                    If (LEqual (Local0, 0x8A))
                                                    {
                                                        If (REGX)
                                                        {
                                                            \_SB.PCI0.PEGP.ATIG.SWDP ()
                                                        }
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Local0, 0x5B))
                                                        {
                                                            If (REGX)
                                                            {
                                                                Notify (\_SB.HOTK, 0x6A)
                                                            }
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (Local0, 0x2A))
                                                            {
                                                                If (REGX)
                                                                {
                                                                    Notify (\_SB.HOTK, 0x32)
                                                                }
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (Local0, 0x2C))
                                                                {
                                                                    If (REGX)
                                                                    {
                                                                        Notify (\_SB.HOTK, 0x31)
                                                                    }
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (Local0, 0x2B))
                                                                    {
                                                                        If (REGX)
                                                                        {
                                                                            Notify (\_SB.HOTK, 0x30)
                                                                        }
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (Local0, 0x69))
                                                                        {
                                                                            If (REGX)
                                                                            {
                                                                                Notify (\_SB.HOTK, 0x5C)
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Method (SDSP, 1, NotSerialized)
            {
                If (REGX)
                {
                    \_SB.PCI0.PEGP.ATIG.SDPD ()
                }

                Return (0x01)
            }

            Name (APWM, Package (0x10)
            {
                0x29, 
                0x36, 
                0x43, 
                0x50, 
                0x5D, 
                0x6B, 
                0x77, 
                0x86, 
                0x93, 
                0xA0, 
                0xAD, 
                0xBA, 
                0xC7, 
                0xD4, 
                0xF0, 
                0xFF
            })
            Name (BPWM, Package (0x10)
            {
                0x29, 
                0x36, 
                0x43, 
                0x50, 
                0x5D, 
                0x6B, 
                0x77, 
                0x86, 
                0x93, 
                0xA0, 
                0xAD, 
                0xBA, 
                0xC7, 
                0xD4, 
                0xF0, 
                0xFF
            })
        }
    }

    Scope (\_TZ)
    {
        PowerResource (PF0, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
		/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x01)) */
		If (LOr (FSTA, 0x01))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN0 _ON ----", Debug)
                Or (FSTA, 0x01, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN0 _OFF ----", Debug)
                And (FSTA, Not (0x01), FSTA)
                FCTL ()
            }
        }

        PowerResource (PF1, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
		/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x02)) */
		If (LOr (FSTA, 0x02))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN1 _ON ----", Debug)
                Or (FSTA, 0x02, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN1 _OFF ----", Debug)
                And (FSTA, Not (0x02), FSTA)
                FCTL ()
            }
        }

        PowerResource (PF2, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
		/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x03)) */
		If (LOr (FSTA, 0x03))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN2 _ON ----", Debug)
                Or (FSTA, 0x04, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN2 _OFF ----", Debug)
                And (FSTA, Not (0x04), FSTA)
                FCTL ()
            }
        }

        PowerResource (PF3, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
		/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x04)) */
		If (LOr (FSTA, 0x04))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN3 _ON ----", Debug)
                Or (FSTA, 0x08, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN3 _OFF ----", Debug)
                And (FSTA, Not (0x08), FSTA)
                FCTL ()
            }
        }

        PowerResource (PF4, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
		/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x05)) */
		If (LOr (FSTA, 0x05))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN4 _ON ----", Debug)
                Or (FSTA, 0x10, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN4 _OFF ----", Debug)
                And (FSTA, Not (0x10), FSTA)
                FCTL ()
            }
        }

        PowerResource (PF5, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
            	/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x06)) */
		If (LOr (FSTA, 0x06))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN5 _ON ----", Debug)
                Or (FSTA, 0x20, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN5 _OFF ----", Debug)
                And (FSTA, Not (0x20), FSTA)
                FCTL ()
            }
        }

        PowerResource (PF6, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
            	/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x07)) */
		If (LOr (FSTA, 0x07))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN6 _ON ----", Debug)
                Or (FSTA, 0x40, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN6 _OFF ----", Debug)
                And (FSTA, Not (0x40), FSTA)
                FCTL ()
            }
        }

        PowerResource (PF7, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {

            	/* FindSetRightBit (FSTA, Local1) */
                /* If (LEqual (Local1, 0x08)) */
		If (LOr (FSTA, 0x08))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_ON, 0, NotSerialized)
            {
                Store (" ---- FAN7 _ON ----", Debug)
                Or (FSTA, 0x80, FSTA)
                If (LGreaterEqual (WAFF, 0x08))
                {
                    FCTL ()
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LLessEqual (WAFF, 0x08))
                {
                    Add (WAFF, 0x01, WAFF)
                }

                Store (" ---- FAN7 _OFF ----", Debug)
                And (FSTA, Not (0x80), FSTA)
                FCTL ()
            }
        }

        Device (FAN0)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x00)
            Name (_PR0, Package (0x01)
            {
                PF0
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (FAN1)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x01)
            Name (_PR0, Package (0x01)
            {
                PF1
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (FAN2)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x02)
            Name (_PR0, Package (0x01)
            {
                PF2
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (FAN3)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x03)
            Name (_PR0, Package (0x01)
            {
                PF3
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (FAN4)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x04)
            Name (_PR0, Package (0x01)
            {
                PF4
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (FAN5)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x05)
            Name (_PR0, Package (0x01)
            {
                PF5
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (FAN6)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x06)
            Name (_PR0, Package (0x01)
            {
                PF6
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (FAN7)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, 0x07)
            Name (_PR0, Package (0x01)
            {
                PF7
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Name (FSTA, 0x00)
        Name (CCPM, 0x00)
        Name (AC0, 0x00)
        Name (AC1, 0x00)
        Name (AC2, 0x00)
        Name (AC3, 0x00)
        Name (AC4, 0x00)
        Name (AC5, 0x00)
        Name (AC6, 0x00)
        Name (AC7, 0x00)
        Name (PSV, 0x00)
        Name (CRT, 0x00)
        Name (HOT, 0x00)
        Name (TMP, 0x00)
        Name (CPUN, 0x02)
        Name (CURT, 0x00)
        Name (WAFF, 0x00)
        ThermalZone (TZ0)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Store (ECTM (), Local1)
                Store (DTS (), Local2)
                If (LGreaterEqual (Local1, Local2))
                {
                    Store (Local1, Local0)
                }
                Else
                {
                    Store (Local2, Local0)
                }

                Store (Local0, TMP)
                Return (CTOK (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store (GTPT (0x30), Local0)
                Store (Local0, CRT)
                Return (CTOK (Local0))
            }

            Method (_PSL, 0, NotSerialized)
            {
                If (LGreaterEqual (CPUN, 0x02))
                {
                    Return (Package (0x02)
                    {
                        \_PR.P001, 
                        \_PR.P002
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.P001
                })
            }

            Method (_PSV, 0, NotSerialized)
            {
                Store (GTPT (0x20), Local0)
                Store (Local0, PSV)
                Return (CTOK (Local0))
            }

            Method (_AC0, 0, NotSerialized)
            {
                Store (GTPT (0x10), Local0)
                Store (Local0, AC0)
                Return (CTOK (Local0))
            }

            Method (_AC1, 0, NotSerialized)
            {
                Store (GTPT (0x11), Local0)
                Store (Local0, AC1)
                Return (CTOK (Local0))
            }

            Method (_AC2, 0, NotSerialized)
            {
                Store (GTPT (0x12), Local0)
                Store (Local0, AC2)
                Return (CTOK (Local0))
            }

            Method (_AC3, 0, NotSerialized)
            {
                Store (GTPT (0x13), Local0)
                Store (Local0, AC3)
                Return (CTOK (Local0))
            }

            Method (_AC4, 0, NotSerialized)
            {
                Store (GTPT (0x14), Local0)
                Store (Local0, AC4)
                Return (CTOK (Local0))
            }

            Method (_AC5, 0, NotSerialized)
            {
                Store (GTPT (0x15), Local0)
                Store (Local0, AC5)
                Return (CTOK (Local0))
            }

            Method (_AC6, 0, NotSerialized)
            {
                Store (GTPT (0x16), Local0)
                Store (Local0, AC6)
                Return (CTOK (Local0))
            }

            Method (_AC7, 0, NotSerialized)
            {
                Store (GTPT (0x17), Local0)
                Store (Local0, AC7)
                Return (CTOK (Local0))
            }

            Method (_AL0, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN0
                })
            }

            Method (_AL1, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN1
                })
            }

            Method (_AL2, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN2
                })
            }

            Method (_AL3, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN3
                })
            }

            Method (_AL4, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN4
                })
            }

            Method (_AL5, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN5
                })
            }

            Method (_AL6, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN6
                })
            }

            Method (_AL7, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    FAN7
                })
            }

            Method (_SCP, 1, NotSerialized)
            {
                Store (Arg0, CCPM)
                ECTP ()
            }

            Name (_TC1, 0x1E)
            Name (_TC2, 0x1E)
            Name (_TSP, 0x32)
        }

        Method (FTMP, 1, NotSerialized)
        {
            Store (Arg0, CURT)
            Notify (TZ0, 0x80)
        }

        Method (TMCH, 0, NotSerialized)
        {
            Notify (TZ0, 0x80)
        }

        Method (TPCH, 0, NotSerialized)
        {
            Notify (\_TZ.TZ0, 0x81)
        }

        Method (CTOK, 1, NotSerialized)
        {
            And (Arg0, 0xFF, Local0)
            If (LGreaterEqual (Local0, 0x80))
            {
                Subtract (0x0100, Local0, Local0)
                Multiply (Local0, 0x0A, Local0)
                Subtract (0x0AAC, Local0, Local0)
                Return (Local0)
            }

            Multiply (Local0, 0x0A, Local0)
            Add (Local0, 0x0AAC, Local0)
            Return (Local0)
        }

        Method (KTOC, 1, NotSerialized)
        {
            Subtract (Arg0, 0x0AAC, Local0)
            Divide (Local0, 0x0A, Local1, Local0)
            Return (Local0)
        }

        Method (ECTM, 0, NotSerialized)
        {
            Store (\_SB.PCI0.ISA.EC50 (0x00), Local0)
            Return (Local0)
        }

        Method (DTS, 0, NotSerialized)
        {
            Store (Zero, Local0)
            Return (Local0)
        }

        Method (ECTP, 0, NotSerialized)
        {
            If (CTJM)
            {
                Store (Zero, Local0)
                Store (DerefOf (Index (ECP1, CCPM)), Local1)
                Store (DerefOf (Index (Local1, Zero)), Local1)
                Store (SizeOf (Local1), Local1)
                Store (DerefOf (Index (ECP1, CCPM)), Local2)
                While (LLess (Local0, Local1))
                {
                    Store (DerefOf (Index (Local2, 0x00)), Local3)
                    Store (DerefOf (Index (Local3, Local0)), Local4)
                    Store (DerefOf (Index (Local2, 0x01)), Local3)
                    Store (DerefOf (Index (Local3, Local0)), Local5)
                    Store (DerefOf (Index (Local2, 0x02)), Local3)
                    Store (DerefOf (Index (Local3, Local0)), Local6)
                    \_SB.PCI0.ISA.EC52 (Local4, Local5, Local6)
                    Increment (Local0)
                }
            }
            Else
            {
                Store (Zero, Local0)
                Store (DerefOf (Index (ECP2, CCPM)), Local1)
                Store (DerefOf (Index (Local1, Zero)), Local1)
                Store (SizeOf (Local1), Local1)
                Store (DerefOf (Index (ECP2, CCPM)), Local2)
                While (LLess (Local0, Local1))
                {
                    Store (DerefOf (Index (Local2, 0x00)), Local3)
                    Store (DerefOf (Index (Local3, Local0)), Local4)
                    Store (DerefOf (Index (Local2, 0x01)), Local3)
                    Store (DerefOf (Index (Local3, Local0)), Local5)
                    Store (DerefOf (Index (Local2, 0x02)), Local3)
                    Store (DerefOf (Index (Local3, Local0)), Local6)
                    \_SB.PCI0.ISA.EC52 (Local4, Local5, Local6)
                    Increment (Local0)
                }
            }

            \_SB.PCI0.ISA.EC57 (0x01)
        }

        Name (ECP1, Package (0x02)
        {
            Package (0x03)
            {
                Package (0x14)
                {
                    0x01008028, 
                    0x0100813C, 
                    0x01008246, 
                    0x01008350, 
                    0x01008458, 
                    0x01008562, 
                    0x0100865C, 
                    0x01008761, 
                    0x01008864, 
                    0x01008967, 
                    0x01008A7F, 
                    0x01000080, 
                    0x0100011E, 
                    0x01000232, 
                    0x0100033C, 
                    0x01000446, 
                    0x0100054B, 
                    0x0100064E, 
                    0x01000753, 
                    0x0100087F
                }, 

                Package (0x14)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00
                }, 

                Package (0x14)
                {
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x0200, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x0100, 
                    0x0100, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x00800000, 
                    0x0200, 
                    0x00
                }
            }, 

            Package (0x03)
            {
                Package (0x14)
                {
                    0x01008028, 
                    0x0100813C, 
                    0x01008246, 
                    0x01008350, 
                    0x01008458, 
                    0x01008562, 
                    0x0100865C, 
                    0x01008761, 
                    0x01008864, 
                    0x01008967, 
                    0x01008A7F, 
                    0x01000080, 
                    0x0100011E, 
                    0x01000232, 
                    0x0100033C, 
                    0x01000446, 
                    0x0100054B, 
                    0x0100064E, 
                    0x01000753, 
                    0x0100087F
                }, 

                Package (0x14)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00
                }, 

                Package (0x14)
                {
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x0200, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x0100, 
                    0x0100, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x00800000, 
                    0x0200, 
                    0x00
                }
            }
        })
        Name (ECP2, Package (0x02)
        {
            Package (0x03)
            {
                Package (0x16)
                {
                    0x0100802D, 
                    0x0100813C, 
                    0x01008244, 
                    0x0100834B, 
                    0x01008450, 
                    0x01008555, 
                    0x01008662, 
                    0x0100876C, 
                    0x01008870, 
                    0x01008973, 
                    0x01008A78, 
                    0x01008B7F, 
                    0x01000080, 
                    0x01000123, 
                    0x01000230, 
                    0x0100033C, 
                    0x01000444, 
                    0x0100054B, 
                    0x01000650, 
                    0x0100075A, 
                    0x01000862, 
                    0x0100097F
                }, 

                Package (0x16)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00
                }, 

                Package (0x16)
                {
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x0200, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x0100, 
                    0x0100, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x0200, 
                    0x00
                }
            }, 

            Package (0x03)
            {
                Package (0x16)
                {
                    0x0100802D, 
                    0x0100813C, 
                    0x01008244, 
                    0x0100834B, 
                    0x01008450, 
                    0x01008555, 
                    0x01008662, 
                    0x0100876C, 
                    0x01008870, 
                    0x01008973, 
                    0x01008A78, 
                    0x01008B7F, 
                    0x01000080, 
                    0x01000123, 
                    0x01000230, 
                    0x0100033C, 
                    0x01000444, 
                    0x0100054B, 
                    0x01000650, 
                    0x0100075A, 
                    0x01000862, 
                    0x0100097F
                }, 

                Package (0x16)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00
                }, 

                Package (0x16)
                {
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x0200, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x0100, 
                    0x0100, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00800000, 
                    0x00010000, 
                    0x0200, 
                    0x00
                }
            }
        })
        Method (ETZ0, 0, NotSerialized)
        {
            Notify (\_TZ.TZ0, 0x80)
        }

        Method (GTLT, 0, NotSerialized)
        {
            If (CTJM)
            {
                Store (DerefOf (Index (CLPT, CCPM)), Local1)
            }
            Else
            {
                Store (DerefOf (Index (CLP1, CCPM)), Local1)
            }

            Store (DerefOf (Index (Local1, Zero)), Local0)
            Return (Local0)
        }

        Method (GDTP, 0, NotSerialized)
        {
            If (CTJM)
            {
                Store (DerefOf (Index (CLPT, CCPM)), Local1)
            }
            Else
            {
                Store (DerefOf (Index (CLP1, CCPM)), Local1)
            }

            Store (DerefOf (Index (Local1, 0x01)), Local0)
            Return (Local0)
        }

        Method (GUTP, 0, NotSerialized)
        {
            If (CTJM)
            {
                Store (DerefOf (Index (CLPT, CCPM)), Local1)
            }
            Else
            {
                Store (DerefOf (Index (CLP1, CCPM)), Local1)
            }

            Store (DerefOf (Index (Local1, 0x02)), Local0)
            Return (Local0)
        }

        Method (FCTL, 0, Serialized)
        {
            Store (" ---- FCTL ----", Debug)
            FindSetRightBit (FSTA, Local1)
            If (LEqual (FSTA, 0x00))
            {
                FOFF ()
            }
            Else
            {
                Store (GTLT (), Local2)
                Store (GUTP (), Local0)
                If (LEqual (Local1, 0x01))
                {
                    Store (Match (Local2, MEQ, 0x10, MTR, 0x00, 0x00), Local3)
                }
                Else
                {
                    If (LEqual (Local1, 0x02))
                    {
                        Store (Match (Local2, MEQ, 0x11, MTR, 0x00, 0x00), Local3)
                    }
                    Else
                    {
                        If (LEqual (Local1, 0x03))
                        {
                            Store (Match (Local2, MEQ, 0x12, MTR, 0x00, 0x00), Local3)
                        }
                        Else
                        {
                            If (LEqual (Local1, 0x04))
                            {
                                Store (Match (Local2, MEQ, 0x13, MTR, 0x00, 0x00), Local3)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x05))
                                {
                                    Store (Match (Local2, MEQ, 0x14, MTR, 0x00, 0x00), Local3)
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x06))
                                    {
                                        Store (Match (Local2, MEQ, 0x15, MTR, 0x00, 0x00), Local3)
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x07))
                                        {
                                            Store (Match (Local2, MEQ, 0x16, MTR, 0x00, 0x00), Local3)
                                        }
                                        Else
                                        {
                                            If (LEqual (Local1, 0x08))
                                            {
                                                Store (Match (Local2, MEQ, 0x17, MTR, 0x00, 0x00), Local3)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Increment (Local3)
                Store (DerefOf (Index (Local2, 0x00)), Local4)
                And (Local4, 0x0F, Local4)
		/* Local4 = 7 */
                If (LGreater (Local3, Local4))
                {
                    Store (Local4, Local3)
                }

                Store (GSPD (Local3), Local5)
                FON (Local5)
            }

            Notify (TZ0, 0x81)
        }

        Method (FON, 1, NotSerialized)
        {
            \_SB.PCI0.ISA.EC55 (0x00, Arg0)
        }

        Method (FOFF, 0, NotSerialized)
        {
            \_SB.PCI0.ISA.EC55 (0x00, 0x00)
        }

        Method (GTPT, 1, NotSerialized)
        {
            Store (GTLT (), Local1)
            Store (Match (Local1, MEQ, Arg0, MTR, 0x00, 0x00), Local2)
            If (LEqual (Arg0, 0x20))
            {
                Store (Zero, Local3)
            }
            Else
            {
                If (LEqual (Arg0, 0x40))
                {
                    Store (Zero, Local3)
                }
                Else
                {
                    If (LEqual (Arg0, 0x30))
                    {
                        Store (Zero, Local3)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x10))
                        {
                            If (And (FSTA, 0x01))
                            {
                                Store (Zero, Local3)
                                Increment (Local2)
                            }
                            Else
                            {
                                Store (One, Local3)
                            }
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x11))
                            {
                                If (And (FSTA, 0x02))
                                {
                                    Store (Zero, Local3)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (One, Local3)
                                }
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x12))
                                {
                                    If (And (FSTA, 0x04))
                                    {
                                        Store (Zero, Local3)
                                        Increment (Local2)
                                    }
                                    Else
                                    {
                                        Store (One, Local3)
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x13))
                                    {
                                        If (And (FSTA, 0x08))
                                        {
                                            Store (Zero, Local3)
                                            Increment (Local2)
                                        }
                                        Else
                                        {
                                            Store (One, Local3)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x14))
                                        {
                                            If (And (FSTA, 0x10))
                                            {
                                                Store (Zero, Local3)
                                                Increment (Local2)
                                            }
                                            Else
                                            {
                                                Store (One, Local3)
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (Arg0, 0x15))
                                            {
                                                If (And (FSTA, 0x20))
                                                {
                                                    Store (Zero, Local3)
                                                    Increment (Local2)
                                                }
                                                Else
                                                {
                                                    Store (One, Local3)
                                                }
                                            }
                                            Else
                                            {
                                                If (LEqual (Arg0, 0x16))
                                                {
                                                    If (And (FSTA, 0x40))
                                                    {
                                                        Store (Zero, Local3)
                                                        Increment (Local2)
                                                    }
                                                    Else
                                                    {
                                                        Store (One, Local3)
                                                    }
                                                }
                                                Else
                                                {
                                                    If (LEqual (Arg0, 0x17))
                                                    {
                                                        If (And (FSTA, 0x80))
                                                        {
                                                            Store (Zero, Local3)
                                                            Increment (Local2)
                                                        }
                                                        Else
                                                        {
                                                            Store (One, Local3)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Increment (Local3)
            If (CTJM)
            {
                Store (DerefOf (Index (CLPT, CCPM)), Local5)
            }
            Else
            {
                Store (DerefOf (Index (CLP1, CCPM)), Local5)
            }

            Store (DerefOf (Index (Local5, Local3)), Local6)
            Store (DerefOf (Index (Local6, Local2)), Local0)
            If (And (LGreater (Arg0, 0x10), LLess (Arg0, 0x20)))
            {
                If (LEqual (Local3, One))
                {
                    Add (Local0, 0x02, Local0)
                }
            }

            Return (Local0)
        }

        Method (GSPD, 1, NotSerialized)
        {
            If (CTJM)
            {
                Store (DerefOf (Index (FANT, Arg0)), Local0)
            }
            Else
            {
                Store (DerefOf (Index (FANO, Arg0)), Local0)
            }

            Return (Local0)
        }

        Name (CLPT, Package (0x02)
        {
            Package (0x03)
            {
                Package (0x0C)
                {
                    0x17, /* FAN7 o mais fraco, na teoria */
                    0x16, 
                    0x15, 
                    0x14, 
                    0x13, 
                    0x12, 
                    0x11, 
                    0x10, /* FAN0 o mais forte, na teoria */
                    0x20, 
                    0x30, 
                    0xFE, 
                    0xFF
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x1E, /* 30 c */ 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */ 
                    0x41, /* 65 c */ 
                    0x46, /* 70 c */ 
                    0x50, /* 80 c */ 
                    0x5C, 
                    0x61, 
                    0x64, 
                    0x67
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */
                    0x41, /* 65 c */
                    0x46, /* 70 c */
                    0x50, /* 80 c */ 
                    0x5A, /* 90 c */ 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x67
                }
            }, 

            Package (0x03)
            {
                Package (0x0C)
                {
                    0x17, /* FAN7 o mais fraco 2700 RPM */
                    0x16, 
                    0x15, 
                    0x14, 
                    0x13, 
                    0x12, 
                    0x11, 
                    0x10, /* FAN0 o mais forte 5250 RPM */
                    0x20, 
                    0x30, 
                    0xFE, 
                    0xFF
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x1E, /* 30 c */ 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */ 
                    0x41, /* 65 c */ 
                    0x46, /* 70 c */ 
                    0x50, /* 80 c */ 
                    0x5C, 
                    0x61, 
                    0x64, 
                    0x67
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */
                    0x41, /* 65 c */
                    0x46, /* 70 c */
                    0x50, /* 80 c */ 
                    0x5A, /* 90 c */ 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x67
                }
            }

        })
        Name (FANT, Package (0x08)
        {
            0x00, 
            0x0A8C, /* 2700 */
            0x0D48, /* 3400 */
            0x0FA0, /* 4000 */ 
            0x1130, /* 4400 */ 
            0x1482, /* 5250 */
            0x1482,
            0x1482
        })

        Name (CLP1, Package (0x02)
        {
            Package (0x03)
            {
                Package (0x0C)
                {
                    0x17, /* FAN7 o mais fraco, na teoria */
                    0x16, 
                    0x15, 
                    0x14, 
                    0x13, 
                    0x12, 
                    0x11, 
                    0x10, /* FAN0 o mais forte, na teoria */
                    0x20, 
                    0x30, 
                    0xFE, 
                    0xFF
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x1E, /* 30 c */ 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */ 
                    0x41, /* 65 c */ 
                    0x46, /* 70 c */ 
                    0x50, /* 80 c */ 
                    0x5C, 
                    0x61, 
                    0x64, 
                    0x67
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */
                    0x41, /* 65 c */
                    0x46, /* 70 c */
                    0x50, /* 80 c */ 
                    0x5A, /* 90 c */ 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x67
                }
            }, 

            Package (0x03)
            {
                Package (0x0C)
                {
                    0x17, /* FAN7 o mais fraco 2700 RPM */
                    0x16, 
                    0x15, 
                    0x14, 
                    0x13, 
                    0x12, 
                    0x11, 
                    0x10, /* FAN0 o mais forte 5250 RPM */
                    0x20, 
                    0x30, 
                    0xFE, 
                    0xFF
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x1E, /* 30 c */ 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */ 
                    0x41, /* 65 c */ 
                    0x46, /* 70 c */ 
                    0x50, /* 80 c */ 
                    0x5C, 
                    0x61, 
                    0x64, 
                    0x67
                }, 

                Package (0x0C)
                {
                    0x00, 
                    0x28, /* 40 c */
                    0x32, /* 50 c */
                    0x3C, /* 60 c */
                    0x41, /* 65 c */
                    0x46, /* 70 c */
                    0x50, /* 80 c */ 
                    0x5A, /* 90 c */ 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x67
                }
            }

        })
        Name (FANO, Package (0x08)
        {
            0x00, 
            0x0A8C, /* 2700 */
            0x0D48, /* 3400 */
            0x0FA0, /* 4000 */ 
            0x1130, /* 4400 */ 
            0x1482, /* 5250 */
            0x1482,
            0x1482
        })
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, ASSB)
        Store (0x00, AOTB)
        Store (0x00, AAXB)
        Store (0x01, SSS)
        Store (0x01, SSE)
        \_SB.PCI0.ISA.EC62 (0x04, 0xBB)
        Sleep (0x64)
        \_SB.PCI0.ISA.EC62 (0x04, 0xCA)
        If (LNotEqual (Arg0, 0x03))
        {
            \_SB.PCI0.ISA.ECEF (0x01)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0x00, SSE)
        Notify (\_SB.SLPB, 0x02)
        If (LNotEqual (Arg0, 0x03))
        {
            \_TZ.ECTP ()
        }
    }

    Scope (_GPE)
    {
    }
}

