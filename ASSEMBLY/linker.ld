ENTRY(_start)

MEMORY
{
    IMEM (rx) : ORIGIN = 0x0, LENGTH = 2M   /* Instructions start at 0x0 */
    DMEM (rw) : ORIGIN = 0x1000, LENGTH = 2M /* Data starts at 0x10000 */
}

SECTIONS
{
    /* .text section for code, placed in IMEM (at 0x0) */
    .text :
    {
        *(.text)  /* Include all sections named .text */
    } > IMEM

    /* .data section for data, placed in DMEM (at 0x10000) */
    .data :
    {
        *(.data)  /* Include all sections named .data */
    } > DMEM
}

