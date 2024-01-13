import axios from 'axios';
import { Badge } from 'primereact/badge';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';

function History() {

    const [Transaction, setTransaction] = useState([]);
    const [loading ,setloading] = useState(true);

    useEffect(() => {
        axios.get(`/api/TransactionHistory/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setTransaction(res.data.data);
            }
            else{

            }
            setloading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);


    const FormatNum = (Transaction) => {
        return (
            <>
                <span>₱{Transaction.total_amount.toFixed(2)}</span>
            </>
        )
    }
    
    const PriceForm = (Transaction) => {
        return (
            <>
                <span>₱{Transaction.product_price.toFixed(2)}</span>
            </>
        )
    }

    const FormatTotal = (Transaction) => {
        return (
            <>
                <span>₱{Transaction.total.toFixed(2)}</span>
            </>
        )
    }

    const Unit = (Transaction) => {
        return (
            <>
                <span>{
                        Transaction.price_unit === 1 ? <Badge value={'Per Kilo'} /> : <Badge value={'Per Pieces'} />
                    }</span>
            </>
        )
    }

    const PriceUnit = (Transaction) => {
        return (
            <>
                {
                    Transaction.price_unit === 1 ? <Badge value={'Per Kilo'} /> : <Badge value={'Per Pieces'} />
                }
            </>
        )
    }

    const Weight = (Transaction) => {
        return (
            <>
                {
                    Transaction.price_unit === 1 ? <span>{Transaction.weight} / Kilo</span> : <span>{Transaction.weight} / Pieces</span>
                }
            </>
        )
    }

    return (
        <div>
            <Card title="Transaction History">
                <DataTable value={Transaction} paginator paginatorLeft loading={loading} rows={9} >
                    <Column field='name_user' header="Name of Buyer"></Column>
                    <Column field='name' header="Product Name"></Column>
                    <Column field='price_unit' body={PriceUnit} header="Price Unit"></Column>
                    <Column field='product_price' body={PriceForm} header="Product Price"></Column>
                    <Column field='total_amount' body={FormatNum} header="Buyer Bid"></Column>
                    <Column field='weight' body={Weight} header="Unit"></Column>
                    <Column field='total' body={FormatTotal} header="Total Amount"></Column>
                    
                </DataTable>
            </Card>
        </div>
    )
}

export default History