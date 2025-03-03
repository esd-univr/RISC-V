ENTRY(_start)

SECTIONS
{
    /* Sezione delle Istruzioni (codice) */
    .text :
    {
        *(.text)  /* Include tutte le sezioni .text dagli oggetti */
    } > IMEM

    /* Sezione dei Dati */
    .data :
    {
        *(.data)  /* Include tutte le sezioni .data dagli oggetti */
    } > DMEM

    /* Sezione BSS (dati non inizializzati) */
    .bss :
    {
        *(.bss)
    } > BSS
}

/* Layout di memoria */
MEMORY
{
    IMEM (rx) : ORIGIN = 0x0, LENGTH = 2M
    DMEM (rw) : ORIGIN = 0x200000, LENGTH 

