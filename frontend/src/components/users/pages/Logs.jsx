import axios from 'axios';
import moment from 'moment';
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import { FaDesktop } from 'react-icons/fa';
import swal from 'sweetalert';
import { FcInspection } from "react-icons/fc";
import { Card } from 'primereact/card';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';

function Logs() {

    const [Logs, setLogs] = useState([]);
    const [loading, setLoading] = useState(true);
    useEffect(() => {
        const id = localStorage.getItem('auth_id');
        axios.get(`/api/Logs/${id}`).then(res => {
            if(res.data.status === 200){
                setLogs(res.data.data);
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500){
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);

    const date_format = (Logs) => {
        return (
            <>
                {moment(Logs.created_at).format('MMM DD YYYY')}
            </>
        )
    }


    return (
        <div className='container-fluid'>
            <Card title="Activity Logs">
                <DataTable value={Logs} sortMode='multiple' loading={loading} paginator paginatorLeft rows={10} >
                    <Column field='activity' sortable header="Activity" ></Column>
                    <Column field='created_at' sortable body={date_format} header="DateTime" ></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Logs